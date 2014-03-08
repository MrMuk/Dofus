package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class GuildHouseTeleportRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function GuildHouseTeleportRequestMessage() {
         super();
      }
      
      public static const protocolId:uint = 5712;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var houseId:uint = 0;
      
      override public function getMessageId() : uint {
         return 5712;
      }
      
      public function initGuildHouseTeleportRequestMessage(param1:uint=0) : GuildHouseTeleportRequestMessage {
         this.houseId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.houseId = 0;
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
         this.serializeAs_GuildHouseTeleportRequestMessage(param1);
      }
      
      public function serializeAs_GuildHouseTeleportRequestMessage(param1:IDataOutput) : void {
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element houseId.");
         }
         else
         {
            param1.writeInt(this.houseId);
            return;
         }
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_GuildHouseTeleportRequestMessage(param1);
      }
      
      public function deserializeAs_GuildHouseTeleportRequestMessage(param1:IDataInput) : void {
         this.houseId = param1.readInt();
         if(this.houseId < 0)
         {
            throw new Error("Forbidden value (" + this.houseId + ") on element of GuildHouseTeleportRequestMessage.houseId.");
         }
         else
         {
            return;
         }
      }
   }
}
