package com.ankamagames.dofus.network.messages.game.tinsel
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class OrnamentSelectedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function OrnamentSelectedMessage() {
         super();
      }
      
      public static const protocolId:uint = 6369;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var ornamentId:uint = 0;
      
      override public function getMessageId() : uint {
         return 6369;
      }
      
      public function initOrnamentSelectedMessage(param1:uint=0) : OrnamentSelectedMessage {
         this.ornamentId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.ornamentId = 0;
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
         this.serializeAs_OrnamentSelectedMessage(param1);
      }
      
      public function serializeAs_OrnamentSelectedMessage(param1:IDataOutput) : void {
         if(this.ornamentId < 0)
         {
            throw new Error("Forbidden value (" + this.ornamentId + ") on element ornamentId.");
         }
         else
         {
            param1.writeShort(this.ornamentId);
            return;
         }
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_OrnamentSelectedMessage(param1);
      }
      
      public function deserializeAs_OrnamentSelectedMessage(param1:IDataInput) : void {
         this.ornamentId = param1.readShort();
         if(this.ornamentId < 0)
         {
            throw new Error("Forbidden value (" + this.ornamentId + ") on element of OrnamentSelectedMessage.ornamentId.");
         }
         else
         {
            return;
         }
      }
   }
}
