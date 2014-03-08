package com.ankamagames.dofus.network.messages.game.context.fight
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class GameFightTurnReadyMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function GameFightTurnReadyMessage() {
         super();
      }
      
      public static const protocolId:uint = 716;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var isReady:Boolean = false;
      
      override public function getMessageId() : uint {
         return 716;
      }
      
      public function initGameFightTurnReadyMessage(param1:Boolean=false) : GameFightTurnReadyMessage {
         this.isReady = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.isReady = false;
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
         this.serializeAs_GameFightTurnReadyMessage(param1);
      }
      
      public function serializeAs_GameFightTurnReadyMessage(param1:IDataOutput) : void {
         param1.writeBoolean(this.isReady);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_GameFightTurnReadyMessage(param1);
      }
      
      public function deserializeAs_GameFightTurnReadyMessage(param1:IDataInput) : void {
         this.isReady = param1.readBoolean();
      }
   }
}
