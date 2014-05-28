package com.ankamagames.jerakine.utils.crypto
{
   import flash.utils.ByteArray;
   import by.blooddy.crypto.Base64;
   
   public class Base64 extends Object
   {
      
      public function Base64() {
         super();
      }
      
      public static function encode(data:String) : String {
         var bytes:ByteArray = new ByteArray();
         bytes.writeUTFBytes(data);
         return by.blooddy.crypto.Base64.encode(bytes);
      }
      
      public static function encodeByteArray(data:ByteArray) : String {
         return by.blooddy.crypto.Base64.encode(data);
      }
      
      public static function decode(data:String) : String {
         var bytes:ByteArray = by.blooddy.crypto.Base64.decode(data);
         return bytes.readUTFBytes(bytes.length);
      }
      
      public static function decodeToByteArray(data:String) : ByteArray {
         return by.blooddy.crypto.Base64.decode(data);
      }
   }
}
