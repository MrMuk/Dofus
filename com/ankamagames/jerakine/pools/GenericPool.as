package com.ankamagames.jerakine.pools
{
   import flash.utils.Dictionary;
   
   public class GenericPool extends Object
   {
      
      public function GenericPool() {
         super();
      }
      
      private static var _pools:Dictionary;
      
      public static function get(type:Class, ... args) : * {
         if((_pools[type]) && (_pools[type].length))
         {
            return type["create"].apply(null,args.concat(_pools[type].pop()));
         }
         return type["create"].apply(null,args);
      }
      
      public static function free(target:Poolable) : void {
         target.free();
         var type:Class = Object(target).constructor;
         if(!_pools[type])
         {
            _pools[type] = new Array();
         }
         (_pools[type] as Array).push(target);
      }
   }
}
