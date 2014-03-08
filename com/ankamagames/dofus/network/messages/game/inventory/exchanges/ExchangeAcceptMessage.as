package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class ExchangeAcceptMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function ExchangeAcceptMessage() {
         super();
      }
      
      public static const protocolId:uint = 5508;
      
      override public function get isInitialized() : Boolean {
         return true;
      }
      
      override public function getMessageId() : uint {
         return 5508;
      }
      
      public function initExchangeAcceptMessage() : ExchangeAcceptMessage {
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
      
      public function serializeAs_ExchangeAcceptMessage(param1:IDataOutput) : void {
      }
      
      public function deserialize(param1:IDataInput) : void {
      }
      
      public function deserializeAs_ExchangeAcceptMessage(param1:IDataInput) : void {
      }
   }
}
