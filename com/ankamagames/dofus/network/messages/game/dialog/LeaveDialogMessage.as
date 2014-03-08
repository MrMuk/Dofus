package com.ankamagames.dofus.network.messages.game.dialog
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class LeaveDialogMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function LeaveDialogMessage() {
         super();
      }
      
      public static const protocolId:uint = 5502;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var dialogType:uint = 0;
      
      override public function getMessageId() : uint {
         return 5502;
      }
      
      public function initLeaveDialogMessage(param1:uint=0) : LeaveDialogMessage {
         this.dialogType = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.dialogType = 0;
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
         this.serializeAs_LeaveDialogMessage(param1);
      }
      
      public function serializeAs_LeaveDialogMessage(param1:IDataOutput) : void {
         param1.writeByte(this.dialogType);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_LeaveDialogMessage(param1);
      }
      
      public function deserializeAs_LeaveDialogMessage(param1:IDataInput) : void {
         this.dialogType = param1.readByte();
         if(this.dialogType < 0)
         {
            throw new Error("Forbidden value (" + this.dialogType + ") on element of LeaveDialogMessage.dialogType.");
         }
         else
         {
            return;
         }
      }
   }
}
