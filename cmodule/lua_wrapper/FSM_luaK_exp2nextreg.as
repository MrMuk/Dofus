package cmodule.lua_wrapper
{
   public final class FSM_luaK_exp2nextreg extends Machine
   {
      
      public function FSM_luaK_exp2nextreg() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_luaK_exp2nextreg = null;
         _loc1_ = new FSM_luaK_exp2nextreg();
         FSM_luaK_exp2nextreg.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 0;
      
      override public final function work() : void {
      }
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
   }
}
