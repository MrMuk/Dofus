package cmodule.lua_wrapper
{
   public final class FSM_math_min extends Machine
   {
      
      public function FSM_math_min() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_math_min = null;
         _loc1_ = new FSM_math_min();
         FSM_math_min.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 2;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      public var f1:Number;
      
      public var i3:int;
      
      override public final function work() : void {
      }
   }
}
