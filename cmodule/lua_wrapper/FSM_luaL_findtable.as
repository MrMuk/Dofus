package cmodule.lua_wrapper
{
   public final class FSM_luaL_findtable extends Machine
   {
      
      public function FSM_luaL_findtable() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_luaL_findtable = null;
         _loc1_ = new FSM_luaL_findtable();
         FSM_luaL_findtable.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 10;
      
      public static const NumberRegCount:int = 1;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      public var i8:int;
      
      public var f0:Number;
      
      override public final function work() : void {
      }
      
      public var i7:int;
      
      public var i9:int;
   }
}
