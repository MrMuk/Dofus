package cmodule.lua_wrapper
{
   public final class FSM_lua_tointeger extends Machine
   {
      
      public function FSM_lua_tointeger() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_lua_tointeger = null;
         _loc1_ = new FSM_lua_tointeger();
         FSM_lua_tointeger.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 2;
      
      public static const NumberRegCount:int = 1;
      
      override public final function work() : void {
      }
      
      public var i0:int;
      
      public var i1:int;
      
      public var f0:Number;
   }
}
