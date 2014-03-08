package com.ankamagames.dofus.network.messages.game.achievement
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class FriendGuildWarnOnAchievementCompleteStateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function FriendGuildWarnOnAchievementCompleteStateMessage() {
         super();
      }
      
      public static const protocolId:uint = 6383;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var enable:Boolean = false;
      
      override public function getMessageId() : uint {
         return 6383;
      }
      
      public function initFriendGuildWarnOnAchievementCompleteStateMessage(param1:Boolean=false) : FriendGuildWarnOnAchievementCompleteStateMessage {
         this.enable = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.enable = false;
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
         this.serializeAs_FriendGuildWarnOnAchievementCompleteStateMessage(param1);
      }
      
      public function serializeAs_FriendGuildWarnOnAchievementCompleteStateMessage(param1:IDataOutput) : void {
         param1.writeBoolean(this.enable);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_FriendGuildWarnOnAchievementCompleteStateMessage(param1);
      }
      
      public function deserializeAs_FriendGuildWarnOnAchievementCompleteStateMessage(param1:IDataInput) : void {
         this.enable = param1.readBoolean();
      }
   }
}
