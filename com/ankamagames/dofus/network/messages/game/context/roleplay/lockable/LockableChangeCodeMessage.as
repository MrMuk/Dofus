package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class LockableChangeCodeMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function LockableChangeCodeMessage() {
         super();
      }
      
      public static const protocolId:uint = 5666;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var code:String = "";
      
      override public function getMessageId() : uint {
         return 5666;
      }
      
      public function initLockableChangeCodeMessage(param1:String="") : LockableChangeCodeMessage {
         this.code = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.code = "";
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
         this.serializeAs_LockableChangeCodeMessage(param1);
      }
      
      public function serializeAs_LockableChangeCodeMessage(param1:IDataOutput) : void {
         param1.writeUTF(this.code);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_LockableChangeCodeMessage(param1);
      }
      
      public function deserializeAs_LockableChangeCodeMessage(param1:IDataInput) : void {
         this.code = param1.readUTF();
      }
   }
}
