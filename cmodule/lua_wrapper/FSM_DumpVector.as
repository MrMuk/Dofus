package cmodule.lua_wrapper
{
   import flash.events.*;
   import flash.display.*;
   import flash.utils.*;
   import flash.text.*;
   import flash.net.*;
   import flash.system.*;
   
   public final class FSM_DumpVector extends Machine
   {
      
      public function FSM_DumpVector() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_DumpVector = null;
         _loc1_ = new FSM_DumpVector();
         FSM_DumpVector.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 9;
      
      public static const NumberRegCount:int = 0;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      override public final function work() : void {
      }
      
      public var i7:int;
   }
}
