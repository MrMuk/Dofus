package com.ankamagames.dofus.network.messages.web.krosmaster
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class KrosmasterInventoryRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function KrosmasterInventoryRequestMessage() {
         super();
      }
      
      public static const protocolId:uint = 6344;
      
      override public function get isInitialized() : Boolean {
         return true;
      }
      
      override public function getMessageId() : uint {
         return 6344;
      }
      
      public function initKrosmasterInventoryRequestMessage() : KrosmasterInventoryRequestMessage {
         return this;
      }
      
      override public function reset() : void {
      }
      
      override public function pack(param1:IDataOutput) : void {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void {
      }
      
      public function serializeAs_KrosmasterInventoryRequestMessage(param1:IDataOutput) : void {
      }
      
      public function deserialize(param1:IDataInput) : void {
      }
      
      public function deserializeAs_KrosmasterInventoryRequestMessage(param1:IDataInput) : void {
      }
   }
}
