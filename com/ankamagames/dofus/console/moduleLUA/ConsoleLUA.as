﻿package com.ankamagames.dofus.console.moduleLUA
{
    import flash.text.StyleSheet;
    import flash.display.NativeWindow;
    import flash.display.Sprite;
    import flash.text.TextField;
    import com.ankamagames.dofus.console.moduleLogger.TextFieldScrollBar;
    import com.ankamagames.dofus.console.moduleLogger.TextFieldOldScrollBarH;
    import com.ankamagames.dofus.misc.utils.frames.LuaScriptRecorderFrame;
    import __AS3__.vec.Vector;
    import com.ankamagames.jerakine.lua.LuaPlayer;
    import flash.display.NativeWindowInitOptions;
    import flash.events.Event;
    import flash.events.NativeWindowBoundsEvent;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.text.TextFormat;
    import flash.events.MouseEvent;
    import com.ankamagames.dofus.console.moduleLogger.ConsoleIcon;
    import flash.events.NativeWindowDisplayStateEvent;
    import com.ankamagames.dofus.kernel.Kernel;
    import flash.utils.getTimer;
    import com.ankamagames.atouin.AtouinConstants;
    import com.ankamagames.jerakine.script.ScriptsManager;
    import com.ankamagames.jerakine.lua.LuaPlayerEvent;
    import flash.filesystem.File;
    import flash.net.FileFilter;
    import flash.filesystem.FileStream;
    import flash.filesystem.FileMode;
    import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayContextFrame;
    import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
    import com.ankamagames.atouin.types.SpriteWrapper;
    import com.ankamagames.atouin.types.WorldEntitySprite;
    import com.ankamagames.atouin.Atouin;
    import __AS3__.vec.*;

    public class ConsoleLUA 
    {

        private static const OPTIONS_HEIGHT:uint = 30;
        private static const OPTIONS_BACKGROUND_COLOR:uint = 4473941;
        private static const ICON_SIZE:int = 24;
        private static const ICON_INTERVAL:int = 12;
        private static const ICON_INTERVAL_BREAK:int = 14;
        private static const SCROLLBAR_SIZE:uint = 10;
        private static const FILTER_UI_COLOR:uint = 4473941;
        private static const BACKGROUND_COLOR:uint = 0x222222;
        private static const OUTPUT_COLOR:uint = 0xD4D4D4;
        private static const SCROLL_BG_COLOR:uint = 4473941;
        private static const SCROLL_COLOR:uint = 6710920;
        private static var _btnID:int = 0;
        private static const BTN_RECORD:int = _btnID++;
        private static const BTN_TIMER_AUTO:int = _btnID++;
        private static const BTN_TIMER:int = _btnID++;
        private static const BTN_MOVE_DEFAULT:int = _btnID++;
        private static const BTN_MOVE_WALK:int = _btnID++;
        private static const BTN_MOVE_RUN:int = _btnID++;
        private static const BTN_MOVE_TELEPORT:int = _btnID++;
        private static const BTN_MOVE_SLIDE:int = _btnID++;
        private static const BTN_CAMERA_AUTOFOLLOW:int = _btnID++;
        private static const BTN_CAMERA_ZOOM_IN:int = _btnID++;
        private static const BTN_CAMERA_ZOOM_OUT:int = _btnID++;
        private static const BTN_PLAY:int = _btnID++;
        private static const BTN_STOP:int = _btnID++;
        private static const BTN_AUTO_RESET:int = _btnID++;
        private static const BTN_RESET_WORLD:int = _btnID++;
        private static const BTN_OPEN:int = _btnID++;
        private static const BTN_EXPORT:int = _btnID++;
        private static const btnIcons:Array = ["record", "waitAuto", "wait", "moveDefault", "moveWalk", "moveRun", "moveTeleport", "moveSlide", "cameraAutoFollow", "cameraZoomIn", "cameraZoomOut", "play", "stop", "autoReset", "resetWorld", "open", "save"];
        private static const btnToolTips:Array = ["Start/Pause recording", "Record automatically 'wait' commands", "Start/Stop command 'wait'", "Set movement mode to game default", "Set movement mode to walk", "Set movement mode to run", "Set movement mode to teleport", "Set movement mode to slide", "Start/Stop camera from following automatically the player", "Camera zoom in", "Camera zoom out", "Play script", "Stop recording", "Toggle reset of the map at the end of a script being played", "Reset map", "Load script", "Stop and export the script"];
        public static const CONSOLE_STYLE:StyleSheet = new StyleSheet();
        private static var _self:ConsoleLUA;

        private var _window:NativeWindow;
        private var _iconList:Sprite;
        private var _btns:Array;
        private var _zoomState:TextField;
        private var _textField:TextField;
        private var _scrollBar:TextFieldScrollBar;
        private var _scrollBarH:TextFieldOldScrollBarH;
        private var _backGround:Sprite;
        private var _frame:LuaScriptRecorderFrame;
        private var _lines:Vector.<String>;
        private var _recording:Boolean = false;
        private var _waitStart:Number = -1;
        private var _loadedScript:String;
        private var _luaPlayer:LuaPlayer;

        {
            CONSOLE_STYLE.setStyle(".red", {"color":"#FF0000"});
            CONSOLE_STYLE.setStyle(".gray", {"color":"#7c7c7c"});
            CONSOLE_STYLE.setStyle(".string", {"color":"#c82b2b"});
            CONSOLE_STYLE.setStyle(".local", {"color":"#6e9ef6"});
            CONSOLE_STYLE.setStyle(".number", {"color":"#c7ab55"});
            CONSOLE_STYLE.setStyle(".function", {"color":"#339966"});
        }

        public function ConsoleLUA()
        {
            this._lines = new Vector.<String>();
            super();
            if (_self)
            {
                throw (new Error());
            };
        }

        public static function getInstance():ConsoleLUA
        {
            if (!(_self))
            {
                _self = new (ConsoleLUA)();
            };
            return (_self);
        }


        private function createWindow():void
        {
            var options:NativeWindowInitOptions;
            if (!(this._window))
            {
                options = new NativeWindowInitOptions();
                options.resizable = true;
                this._window = new NativeWindow(options);
                this._window.width = 800;
                this._window.height = 600;
                this._window.title = "LUA Console";
                this._window.addEventListener(Event.CLOSING, this.onClosing);
                this._window.addEventListener(NativeWindowBoundsEvent.RESIZE, this.onResize);
                this._window.stage.align = StageAlign.TOP_LEFT;
                this._window.stage.scaleMode = StageScaleMode.NO_SCALE;
                this._window.stage.tabChildren = false;
                this.createUI();
                this._window.activate();
            };
        }

        private function createUI():void
        {
            this._backGround = new Sprite();
            this._textField = new TextField();
            this._textField.multiline = true;
            this._textField.wordWrap = false;
            this._textField.mouseWheelEnabled = false;
            this._scrollBar = new TextFieldScrollBar(this._textField, this._lines, 10, SCROLL_BG_COLOR, SCROLL_COLOR);
            this._scrollBarH = new TextFieldOldScrollBarH(this._textField, 5, SCROLL_BG_COLOR, SCROLL_COLOR);
            var textFormat:TextFormat = new TextFormat();
            textFormat.font = "Courier New";
            textFormat.size = 16;
            textFormat.color = OUTPUT_COLOR;
            this._textField.defaultTextFormat = textFormat;
            this._textField.styleSheet = CONSOLE_STYLE;
            var posX:int;
            this._iconList = new Sprite();
            this._iconList.doubleClickEnabled = true;
            this._iconList.addEventListener(MouseEvent.DOUBLE_CLICK, this.unlockBtns);
            this._btns = new Array();
            var i:int;
            while (i < (BTN_EXPORT + 1))
            {
                this._btns[i] = new ConsoleIcon(btnIcons[i], ICON_SIZE, btnToolTips[i]);
                this._btns[i].x = posX;
                this._iconList.addChild(this._btns[i]);
                posX = (posX + (ICON_SIZE + ICON_INTERVAL));
                if ((((i == BTN_TIMER_AUTO)) || ((i == BTN_MOVE_SLIDE))))
                {
                    posX = (posX + ICON_INTERVAL_BREAK);
                };
                if (i == BTN_CAMERA_ZOOM_OUT)
                {
                    this._zoomState = new TextField();
                    textFormat = new TextFormat();
                    textFormat.font = "Arial";
                    textFormat.size = 18;
                    textFormat.color = 0xFFFFFF;
                    this._zoomState.defaultTextFormat = textFormat;
                    this._zoomState.x = posX;
                    this._zoomState.text = "x1";
                    this._iconList.addChild(this._zoomState);
                    posX = (posX + (this._zoomState.width + ICON_INTERVAL_BREAK));
                };
                i++;
            };
            this._btns[BTN_RECORD].addEventListener(MouseEvent.CLICK, this.toggleRecord);
            this._btns[BTN_TIMER_AUTO].addEventListener(MouseEvent.CLICK, this.setAutoTimer);
            this._btns[BTN_TIMER].addEventListener(MouseEvent.CLICK, this.toggleTimer);
            this._btns[BTN_MOVE_DEFAULT].addEventListener(MouseEvent.CLICK, this.toggleMoveType);
            this._btns[BTN_MOVE_WALK].addEventListener(MouseEvent.CLICK, this.toggleMoveType);
            this._btns[BTN_MOVE_RUN].addEventListener(MouseEvent.CLICK, this.toggleMoveType);
            this._btns[BTN_MOVE_TELEPORT].addEventListener(MouseEvent.CLICK, this.toggleMoveType);
            this._btns[BTN_MOVE_SLIDE].addEventListener(MouseEvent.CLICK, this.toggleMoveType);
            this._btns[BTN_CAMERA_AUTOFOLLOW].addEventListener(MouseEvent.CLICK, this.toggleCameraAutoFollow);
            this._btns[BTN_CAMERA_ZOOM_IN].addEventListener(MouseEvent.MOUSE_DOWN, this.setZoom);
            this._btns[BTN_CAMERA_ZOOM_OUT].addEventListener(MouseEvent.MOUSE_DOWN, this.setZoom);
            this._btns[BTN_PLAY].addEventListener(MouseEvent.CLICK, this.playScript);
            this._btns[BTN_STOP].addEventListener(MouseEvent.CLICK, this.stopRecord);
            this._btns[BTN_AUTO_RESET].addEventListener(MouseEvent.CLICK, this.toggleAutoReset);
            this._btns[BTN_RESET_WORLD].addEventListener(MouseEvent.CLICK, this.resetWorld);
            this._btns[BTN_OPEN].addEventListener(MouseEvent.CLICK, this.loadScript);
            this._btns[BTN_EXPORT].addEventListener(MouseEvent.CLICK, this.export);
            this._btns[BTN_MOVE_DEFAULT].name = ("moveBtn" + LuaMoveEnum.MOVE_DEFAULT);
            this._btns[BTN_MOVE_WALK].name = ("moveBtn" + LuaMoveEnum.MOVE_WALK);
            this._btns[BTN_MOVE_RUN].name = ("moveBtn" + LuaMoveEnum.MOVE_RUN);
            this._btns[BTN_MOVE_TELEPORT].name = ("moveBtn" + LuaMoveEnum.MOVE_TELEPORT);
            this._btns[BTN_MOVE_SLIDE].name = ("moveBtn" + LuaMoveEnum.MOVE_SLIDE);
            this._window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, this.onResize);
            this._window.stage.addChild(this._backGround);
            this._window.stage.addChild(this._textField);
            this._window.stage.addChild(this._scrollBar);
            this._window.stage.addChild(this._scrollBarH);
            this._window.stage.addChild(this._iconList);
            this.enableButtons(true, [BTN_RECORD]);
            this._btns[BTN_MOVE_DEFAULT].toggled = true;
            this._btns[BTN_TIMER_AUTO].toggled = true;
            this.onResize();
        }

        protected function toggleRecord(event:MouseEvent):void
        {
            var pausingRecording:Boolean;
            try
            {
                this._recording = !(this._recording);
                this._btns[BTN_RECORD].toggled = this._recording;
                pausingRecording = false;
                if (!(this._frame))
                {
                    this.clearConsole();
                    this._frame = new LuaScriptRecorderFrame();
                    if (!(Kernel.getWorker().contains(LuaScriptRecorderFrame)))
                    {
                        Kernel.getWorker().addFrame(this._frame);
                    };
                    this._frame.start(this._btns[BTN_TIMER_AUTO].toggled);
                }
                else
                {
                    if (!(this._frame.running))
                    {
                        this.clearConsole();
                        this._frame.start(this._btns[BTN_TIMER_AUTO].toggled);
                        this._frame.moveType = LuaMoveEnum.MOVE_DEFAULT;
                        this._btns[BTN_MOVE_DEFAULT].toggled = (this._btns[BTN_MOVE_WALK].toggled = (this._btns[BTN_MOVE_RUN].toggled = (this._btns[BTN_MOVE_TELEPORT].toggled = (this._btns[BTN_MOVE_SLIDE].toggled = false))));
                        this._btns[BTN_MOVE_DEFAULT].toggled = true;
                    }
                    else
                    {
                        pausingRecording = true;
                    };
                };
                if (this._recording)
                {
                    this.enableButtons(true, [BTN_RECORD, BTN_TIMER, BTN_PLAY, BTN_STOP]);
                }
                else
                {
                    if (this._frame.luaScript != "")
                    {
                        this.enableButtons(true, [BTN_RECORD, BTN_PLAY]);
                    }
                    else
                    {
                        this.enableButtons(true, [BTN_RECORD]);
                    };
                };
                if (pausingRecording)
                {
                    this._frame.pause = !(this._recording);
                };
            }
            catch(error:Error)
            {
                printLine((("<span class='gray'>> Ooops, couldn't do that. Are you sure you are in game?!</span>\n<span class='red'>" + error.message) + "</span>"), false);
            };
        }

        protected function setAutoTimer(event:MouseEvent):void
        {
            event.target.toggled = !(event.target.toggled);
        }

        protected function toggleTimer(event:MouseEvent):void
        {
            this._btns[BTN_TIMER].toggled = (this._waitStart == -1);
            if (this._waitStart == -1)
            {
                this._frame.pause = true;
                this._waitStart = getTimer();
                this.enableButtons(true, [BTN_TIMER]);
            }
            else
            {
                this._frame.wait((getTimer() - this._waitStart));
                this._waitStart = -1;
                this._frame.pause = false;
                this.enableButtons(true, [BTN_RECORD, BTN_TIMER, BTN_PLAY, BTN_STOP]);
            };
        }

        protected function toggleMoveType(event:MouseEvent):void
        {
            this._frame.moveType = int(event.target.name.replace("moveBtn", ""));
            this._btns[BTN_MOVE_DEFAULT].toggled = (this._btns[BTN_MOVE_WALK].toggled = (this._btns[BTN_MOVE_RUN].toggled = (this._btns[BTN_MOVE_TELEPORT].toggled = (this._btns[BTN_MOVE_SLIDE].toggled = false))));
            event.target.toggled = true;
        }

        protected function toggleCameraAutoFollow(event:MouseEvent):void
        {
            event.target.toggled = !(event.target.toggled);
            this._frame.autoFollowCam(event.target.toggled);
        }

        protected function setZoom(event:MouseEvent):void
        {
            var currentZoom:int = this.getZoomValue();
            this._btns[BTN_CAMERA_ZOOM_IN].enabled = true;
            this._btns[BTN_CAMERA_ZOOM_OUT].enabled = true;
            if (event.target == this._btns[BTN_CAMERA_ZOOM_IN])
            {
                currentZoom++;
                if (currentZoom == AtouinConstants.MAX_ZOOM)
                {
                    this._btns[BTN_CAMERA_ZOOM_IN].enabled = false;
                };
            }
            else
            {
                currentZoom--;
                if (currentZoom == 1)
                {
                    this._btns[BTN_CAMERA_ZOOM_OUT].enabled = false;
                };
            };
            this._zoomState.text = ("x" + currentZoom.toString());
            this._frame.cameraZoom(currentZoom, true);
        }

        protected function playScript(event:MouseEvent):void
        {
            var script:String;
            try
            {
                if (!(this._luaPlayer))
                {
                    this._luaPlayer = (ScriptsManager.getInstance().getPlayer(ScriptsManager.LUA_PLAYER) as LuaPlayer);
                    this._luaPlayer.addEventListener(LuaPlayerEvent.PLAY_COMPLETE, this.onScriptCompleted);
                    this._luaPlayer.addEventListener(LuaPlayerEvent.PLAY_ERROR, this.onScriptError);
                };
                if (this._recording)
                {
                    this.toggleRecord(null);
                };
                script = this._loadedScript;
                if (this._frame)
                {
                    if (this._frame.luaScript.indexOf("seq.start()") == -1)
                    {
                        this._frame.addSeqStart();
                    };
                    script = this._frame.luaScript;
                };
                this.printLine("<span class='gray'>> Playing script...</span>", false);
                this._luaPlayer.playScript(script);
                this._iconList.mouseChildren = false;
                this._iconList.alpha = 0.4;
            }
            catch(error:Error)
            {
                printLine((("<span class='gray'>> Ooops, couldn't play this script. Are you sure you are in game?!</span>\n<span class='red'>" + error.message) + "</span>"), false);
            };
        }

        protected function stopRecord(event:MouseEvent):void
        {
            if (((this._frame) && (this._frame.running)))
            {
                this._frame.stop();
            };
            this._recording = false;
            this._btns[BTN_RECORD].toggled = this._recording;
            this.enableButtons(true, [BTN_RECORD, BTN_PLAY]);
        }

        protected function loadScript(event:MouseEvent):void
        {
            var file:File;
            file = File.documentsDirectory;
            file.browseForOpen("Open LUA script...", [new FileFilter("Script LUA File", "*.lua")]);
            file.addEventListener(Event.SELECT, function (event:Event):void
            {
                stopRecord(null);
                clearConsole();
                var stream:FileStream = new FileStream();
                stream.open(file, FileMode.READ);
                _loadedScript = stream.readUTFBytes(stream.bytesAvailable);
                if (_frame)
                {
                    _frame.luaScript = _loadedScript;
                };
                stream.close();
                printLine((("<span class='gray'>> Script '" + file.name) + "' loaded.</span>"), false);
                printLine(_loadedScript);
                _btns[BTN_PLAY].enabled = true;
            });
        }

        protected function export(event:MouseEvent):void
        {
            var file:File;
            if (!(this._frame))
            {
                return;
            };
            file = File.documentsDirectory.resolvePath("script.lua");
            file.browseForSave("Export .lua file");
            file.addEventListener(Event.SELECT, function (event:Event):void
            {
                stopRecord(null);
                file = (event.target as File);
                var stream:FileStream = new FileStream();
                stream.open(file, FileMode.WRITE);
                stream.writeUTFBytes(_frame.luaScript);
                stream.close();
                printLine((((("<span class='gray'>> Script exported as " + file.name) + " in ") + file.parent.nativePath) + "</span>"), false);
            });
        }

        protected function resetWorld(event:MouseEvent):void
        {
            var rpContextFrame:RoleplayContextFrame;
            var ies:Vector.<InteractiveElement>;
            var i:int;
            var worldObject:SpriteWrapper;
            var entity:WorldEntitySprite;
            try
            {
                rpContextFrame = (Kernel.getWorker().getFrame(RoleplayContextFrame) as RoleplayContextFrame);
                ies = rpContextFrame.entitiesFrame.interactiveElements;
                i = 0;
                while (i < ies.length)
                {
                    worldObject = (Atouin.getInstance().getIdentifiedElement(ies[i].elementId) as SpriteWrapper);
                    entity = (worldObject.getChildAt(0) as WorldEntitySprite);
                    if (entity)
                    {
                        entity.setAnimation("AnimState0");
                    };
                    i = (i + 1);
                };
                if (this._luaPlayer)
                {
                    this._luaPlayer.reset();
                };
            }
            catch(error:Error)
            {
                printLine((("<span class='gray'>> I'm sorry Dave, I'm afraid I can't do that.</span>\n<span class='red'>" + error.message) + "</span>"), false);
            };
        }

        protected function toggleAutoReset(event:MouseEvent):void
        {
            event.target.toggled = !(event.target.toggled);
            if (this._luaPlayer)
            {
                this._luaPlayer.resetOnComplete = !(this._luaPlayer.resetOnComplete);
            };
        }

        protected function unlockBtns(event:MouseEvent):void
        {
            if (!(this._iconList.mouseChildren))
            {
                this._iconList.mouseChildren = true;
                this._iconList.alpha = 1;
            };
        }

        public function toggleDisplay():void
        {
            if (!(this._window))
            {
                this.createWindow();
                return;
            };
            this._window.visible = !(this._window.visible);
            if (this._window.visible)
            {
                this._window.orderToFront();
            };
        }

        public function display(quietMode:Boolean=false):void
        {
            if (quietMode)
            {
                return;
            };
            if (!(this._window))
            {
                this.createWindow();
            };
            this._window.activate();
            this._window.orderToFront();
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.close();
            };
        }

        public function printLine(text:String, needHighlight:Boolean=true):void
        {
            if (needHighlight)
            {
                text = text.replace(/\r/gi, "");
                text = text.replace(/(".*")/g, "<span class='string'>$&</span>");
                text = text.replace(/local/g, "<span class='local'>local</span>");
                text = text.replace(/(?<![a-z])([+-]?[0-9]+(?:\.[0-9]+)?)/g, "<span class='number'>$&</span>");
                text = text.replace(/(?<=[\.])[^.(]+(?=[(])/g, "<span class='function'>$&</span>");
                text = text.replace(/\(/g, "<span class='function'>$&</span>");
                text = text.replace(/\)/g, "<span class='function'>$&</span>");
            };
            var newLines:Array = text.split("\n");
            this._lines.push.apply(this._lines, newLines);
            this._scrollBar.updateScrolling();
            this._scrollBarH.resize();
        }

        private function clearConsole():void
        {
            this._lines = new Vector.<String>();
            this._scrollBar.reset(this._lines);
            this._scrollBar.updateScrolling();
            this._scrollBarH.resize();
        }

        private function onScriptCompleted(event:LuaPlayerEvent):void
        {
            this.printLine("<span class='gray'>> Script finished playing.</span>", false);
            this._iconList.mouseChildren = true;
            this._iconList.alpha = 1;
        }

        private function onScriptError(event:LuaPlayerEvent):void
        {
            this.printLine((("<span class='gray'>> Script could not be played. Error:</span>\n<span class='red'>" + event.stackTrace) + "</span>"), false);
            this._iconList.mouseChildren = true;
            this._iconList.alpha = 1;
        }

        private function onResize(event:Event=null):void
        {
            this._backGround.graphics.clear();
            this._backGround.graphics.beginFill(BACKGROUND_COLOR);
            this._backGround.graphics.drawRect(0, 0, this._window.stage.stageWidth, this._window.stage.stageHeight);
            this._backGround.graphics.endFill();
            this._backGround.graphics.beginFill(OPTIONS_BACKGROUND_COLOR);
            this._backGround.graphics.drawRect(0, 0, this._window.stage.stageWidth, OPTIONS_HEIGHT);
            this._backGround.graphics.endFill();
            if (this._iconList)
            {
                this._iconList.x = 10;
                this._iconList.y = 3;
            };
            this._textField.y = OPTIONS_HEIGHT;
            this._textField.width = (this._window.stage.stageWidth - TextFieldScrollBar.WIDTH);
            this._textField.height = ((this._window.stage.stageHeight - this._textField.y) - SCROLLBAR_SIZE);
            this._textField.scrollV = 0;
            var text:String = "";
            var i:int;
            while (i < 200)
            {
                text = (text + "o\n");
                i++;
            };
            this._textField.text = text;
            var numLines:int = (this._textField.numLines - this._textField.maxScrollV);
            this._textField.text = "";
            this._scrollBar.addEventListener(Event.CHANGE, this.onScrollVChange);
            this._scrollBar.scrollAtEnd();
            this._scrollBar.resize(numLines);
            this._scrollBarH.resize();
        }

        private function onScrollVChange(e:Event):void
        {
            this._scrollBarH.resize();
        }

        private function onClosing(event:Event):void
        {
            this.stopRecord(null);
            this._window.visible = false;
            event.preventDefault();
        }

        private function enableButtons(enabled:Boolean, buttonIDs:Array):void
        {
            var i:int;
            while (i < (this._btns.length - 4))
            {
                if (buttonIDs.indexOf(i) != -1)
                {
                    this._btns[i].enabled = enabled;
                }
                else
                {
                    if ((((i >= BTN_MOVE_DEFAULT)) && ((i <= BTN_CAMERA_ZOOM_OUT))))
                    {
                        this._btns[i].enabled = this._btns[BTN_TIMER].enabled;
                    }
                    else
                    {
                        this._btns[i].enabled = !(enabled);
                    };
                };
                i++;
            };
            this._btns[BTN_TIMER_AUTO].enabled = true;
            if (((this._frame) && (this._frame.running)))
            {
                this._btns[BTN_TIMER_AUTO].enabled = false;
                if (!(this._btns[BTN_PLAY].toggled))
                {
                    this._btns[BTN_TIMER].enabled = !(this._btns[BTN_TIMER_AUTO].toggled);
                };
            };
            if (((((this._frame) && (this._frame.running))) && (this._recording)))
            {
                this._btns[BTN_CAMERA_ZOOM_IN].enabled = (this.getZoomValue() < AtouinConstants.MAX_ZOOM);
                this._btns[BTN_CAMERA_ZOOM_OUT].enabled = (this.getZoomValue() > 1);
            };
        }

        private function getZoomValue():int
        {
            return (int(this._zoomState.text.replace("x", "")));
        }


    }
}//package com.ankamagames.dofus.console.moduleLUA

