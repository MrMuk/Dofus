package com.ankamagames.dofus.network.messages.game.inventory.preset
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class InventoryPresetDeleteResultMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var presetId:uint = 0;
        public var code:uint = 2;
        public static const protocolId:uint = 6173;

        public function InventoryPresetDeleteResultMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 6173;
        }// end function

        public function initInventoryPresetDeleteResultMessage(param1:uint = 0, param2:uint = 2) : InventoryPresetDeleteResultMessage
        {
            this.presetId = param1;
            this.code = param2;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.presetId = 0;
            this.code = 2;
            this._isInitialized = false;
            return;
        }// end function

        override public function pack(param1:IDataOutput) : void
        {
            var _loc_2:* = new ByteArray();
            this.serialize(_loc_2);
            writePacket(param1, this.getMessageId(), _loc_2);
            return;
        }// end function

        override public function unpack(param1:IDataInput, param2:uint) : void
        {
            this.deserialize(param1);
            return;
        }// end function

        public function serialize(param1:IDataOutput) : void
        {
            this.serializeAs_InventoryPresetDeleteResultMessage(param1);
            return;
        }// end function

        public function serializeAs_InventoryPresetDeleteResultMessage(param1:IDataOutput) : void
        {
            if (this.presetId < 0)
            {
                throw new Error("Forbidden value (" + this.presetId + ") on element presetId.");
            }
            param1.writeByte(this.presetId);
            param1.writeByte(this.code);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_InventoryPresetDeleteResultMessage(param1);
            return;
        }// end function

        public function deserializeAs_InventoryPresetDeleteResultMessage(param1:IDataInput) : void
        {
            this.presetId = param1.readByte();
            if (this.presetId < 0)
            {
                throw new Error("Forbidden value (" + this.presetId + ") on element of InventoryPresetDeleteResultMessage.presetId.");
            }
            this.code = param1.readByte();
            if (this.code < 0)
            {
                throw new Error("Forbidden value (" + this.code + ") on element of InventoryPresetDeleteResultMessage.code.");
            }
            return;
        }// end function

    }
}
