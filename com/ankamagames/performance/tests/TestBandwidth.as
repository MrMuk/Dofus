﻿package com.ankamagames.performance.tests
{
    import com.ankamagames.performance.IBenchmarkTest;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequestHeader;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import com.ankamagames.performance.Benchmark;

    public class TestBandwidth implements IBenchmarkTest 
    {

        private static const MAX_DURATION:uint = 4000;
        private static var _results:Array;

        private var _loader:URLLoader;
        private var _urlRequest:URLRequest;
        private var _startTime:Number;
        private var _timer:Timer;

        public function TestBandwidth(loader:URLLoader=null, urlRequest:URLRequest=null)
        {
            if (!(_results))
            {
                _results = [];
            };
            if (!(urlRequest))
            {
                urlRequest = new URLRequest((("http://dl.ak.ankama.com/games/dofus2-streaming/beta/dummy.version_" + new Date().time) + ".file"));
            };
            if (!(loader))
            {
                loader = new URLLoader();
            };
            this._loader = loader;
            this._loader.addEventListener(Event.OPEN, this.onOpen);
            this._loader.addEventListener(Event.COMPLETE, this.onComplete);
            this._loader.addEventListener(IOErrorEvent.IO_ERROR, this.onError);
            this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onError);
            this._urlRequest = urlRequest;
            this._urlRequest.requestHeaders = [new URLRequestHeader("pragma", "no-cache")];
        }

        public static function resetResults():void
        {
            _results = [];
        }

        public static function pushResult(speed:int):void
        {
            if (!(_results))
            {
                _results = [];
            };
            _results.push(speed);
        }


        public function run():void
        {
            this._loader.load(this._urlRequest);
            this._timer = new Timer(MAX_DURATION, 1);
            this._timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            this._timer.start();
        }

        public function cancel():void
        {
            this.clean();
        }

        private function onTimerComplete(event:TimerEvent):void
        {
            this.onError(null);
        }

        private function onOpen(event:Event):void
        {
            this._startTime = getTimer();
        }

        private function onError(event:Event):void
        {
            this.clean();
            Benchmark.onTestCompleted(this);
        }

        private function onComplete(event:Event):void
        {
            this.clean();
            var totalTime:Number = (getTimer() - this._startTime);
            var totalBytes:uint = event.currentTarget.bytesTotal;
            var speed:int = (totalBytes / totalTime);
            _results.push(speed);
            Benchmark.onTestCompleted(this);
        }

        private function clean():void
        {
            if (this._timer)
            {
                this._timer.stop();
                this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
                this._timer = null;
                try
                {
                    this._loader.close();
                }
                catch(error:Error)
                {
                };
                this._loader.removeEventListener(Event.OPEN, this.onOpen);
                this._loader.removeEventListener(Event.COMPLETE, this.onComplete);
                this._loader.removeEventListener(IOErrorEvent.IO_ERROR, this.onError);
                this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onError);
                this._loader = null;
                this._urlRequest = null;
            };
        }

        public function getResults():String
        {
            var average:Number;
            var i:int;
            if (_results)
            {
                if (_results.length == 0)
                {
                    return ("bandwidthTest:error");
                };
                average = 0;
                i = 0;
                while (i < _results.length)
                {
                    average = (average + _results[i]);
                    i++;
                };
                average = (average / _results.length);
                return (("bandwidthTest:" + average.toString()));
            };
            return ("bandwidthTest:none");
        }


    }
}//package com.ankamagames.performance.tests

