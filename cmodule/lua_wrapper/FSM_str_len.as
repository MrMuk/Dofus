package cmodule.lua_wrapper
{
   public final class FSM_str_len extends Machine
   {
      
      public function FSM_str_len() {
         super();
      }
      
      public static function start() : void {
         var _loc1_:FSM_str_len = null;
         _loc1_ = new FSM_str_len();
         FSM_str_len.gworker = _loc1_;
      }
      
      public static const intRegCount:int = 4;
      
      public static const NumberRegCount:int = 1;
      
      public var i0:int;
      
      public var i1:int;
      
      public var i2:int;
      
      public var f0:Number;
      
      override public final function work() : void {
      }
      
      public var i3:int;
   }
}
