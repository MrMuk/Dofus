package com.ankamagames.dofus.network.messages.game.guild.tax
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class GuildFightPlayersHelpersLeaveMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function GuildFightPlayersHelpersLeaveMessage() {
         super();
      }
      
      public static const protocolId:uint = 5719;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var fightId:Number = 0;
      
      public var playerId:uint = 0;
      
      override public function getMessageId() : uint {
         return 5719;
      }
      
      public function initGuildFightPlayersHelpersLeaveMessage(param1:Number=0, param2:uint=0) : GuildFightPlayersHelpersLeaveMessage {
         this.fightId = param1;
         this.playerId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.fightId = 0;
         this.playerId = 0;
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
         this.serializeAs_GuildFightPlayersHelpersLeaveMessage(param1);
      }
      
      public function serializeAs_GuildFightPlayersHelpersLeaveMessage(param1:IDataOutput) : void {
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element fightId.");
         }
         else
         {
            param1.writeDouble(this.fightId);
            if(this.playerId < 0)
            {
               throw new Error("Forbidden value (" + this.playerId + ") on element playerId.");
            }
            else
            {
               param1.writeInt(this.playerId);
               return;
            }
         }
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_GuildFightPlayersHelpersLeaveMessage(param1);
      }
      
      public function deserializeAs_GuildFightPlayersHelpersLeaveMessage(param1:IDataInput) : void {
         this.fightId = param1.readDouble();
         if(this.fightId < 0)
         {
            throw new Error("Forbidden value (" + this.fightId + ") on element of GuildFightPlayersHelpersLeaveMessage.fightId.");
         }
         else
         {
            this.playerId = param1.readInt();
            if(this.playerId < 0)
            {
               throw new Error("Forbidden value (" + this.playerId + ") on element of GuildFightPlayersHelpersLeaveMessage.playerId.");
            }
            else
            {
               return;
            }
         }
      }
   }
}
