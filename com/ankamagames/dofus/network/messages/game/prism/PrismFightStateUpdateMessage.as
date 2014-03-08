package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class PrismFightStateUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function PrismFightStateUpdateMessage() {
         super();
      }
      
      public static const protocolId:uint = 6040;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var state:uint = 0;
      
      override public function getMessageId() : uint {
         return 6040;
      }
      
      public function initPrismFightStateUpdateMessage(param1:uint=0) : PrismFightStateUpdateMessage {
         this.state = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.state = 0;
         this._isInitialized = false;
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
         this.serializeAs_PrismFightStateUpdateMessage(param1);
      }
      
      public function serializeAs_PrismFightStateUpdateMessage(param1:IDataOutput) : void {
         if(this.state < 0)
         {
            throw new Error("Forbidden value (" + this.state + ") on element state.");
         }
         else
         {
            param1.writeByte(this.state);
            return;
         }
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_PrismFightStateUpdateMessage(param1);
      }
      
      public function deserializeAs_PrismFightStateUpdateMessage(param1:IDataInput) : void {
         this.state = param1.readByte();
         if(this.state < 0)
         {
            throw new Error("Forbidden value (" + this.state + ") on element of PrismFightStateUpdateMessage.state.");
         }
         else
         {
            return;
         }
      }
   }
}
