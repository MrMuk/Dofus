package cmodule.lua_wrapper
{
   public final class FSM_lua_rawset extends Machine
   {
      
      public function FSM_lua_rawset() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_lua_rawset = null;
         _loc1_ = new FSM_lua_rawset();
         FSM_lua_rawset.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 8;
      
      public static const NumberRegCount:int = 2;
      
      override public final function work() : void {
      }
      
      public var f1:Number;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var f0:Number;
      
      public var i7:int;
   }
}
