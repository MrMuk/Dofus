package cmodule.lua_wrapper
{
   public final class FSM_jumponcond extends Machine
   {
      
      public function FSM_jumponcond() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_jumponcond = null;
         _loc1_ = new FSM_jumponcond();
         FSM_jumponcond.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 7;
      
      public static const NumberRegCount:int = 0;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var i3:int;
      
      public var i4:int;
      
      public var i5:int;
      
      public var i6:int;
      
      override public final function work() : void {
      }
   }
}
