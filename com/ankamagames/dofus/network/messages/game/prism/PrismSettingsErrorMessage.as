package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class PrismSettingsErrorMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function PrismSettingsErrorMessage() {
         super();
      }
      
      public static const protocolId:uint = 6442;
      
      override public function get isInitialized() : Boolean {
         return true;
      }
      
      override public function getMessageId() : uint {
         return 6442;
      }
      
      public function initPrismSettingsErrorMessage() : PrismSettingsErrorMessage {
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
      
      public function serializeAs_PrismSettingsErrorMessage(param1:IDataOutput) : void {
      }
      
      public function deserialize(param1:IDataInput) : void {
      }
      
      public function deserializeAs_PrismSettingsErrorMessage(param1:IDataInput) : void {
      }
   }
}
