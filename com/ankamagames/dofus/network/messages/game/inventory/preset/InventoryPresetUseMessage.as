package com.ankamagames.dofus.network.messages.game.inventory.preset
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class InventoryPresetUseMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var presetId:uint = 0;
        public static const protocolId:uint = 6167;

        public function InventoryPresetUseMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 6167;
        }// end function

        public function initInventoryPresetUseMessage(param1:uint = 0) : InventoryPresetUseMessage
        {
            this.presetId = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.presetId = 0;
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
            this.serializeAs_InventoryPresetUseMessage(param1);
            return;
        }// end function

        public function serializeAs_InventoryPresetUseMessage(param1:IDataOutput) : void
        {
            if (this.presetId < 0)
            {
                throw new Error("Forbidden value (" + this.presetId + ") on element presetId.");
            }
            param1.writeByte(this.presetId);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_InventoryPresetUseMessage(param1);
            return;
        }// end function

        public function deserializeAs_InventoryPresetUseMessage(param1:IDataInput) : void
        {
            this.presetId = param1.readByte();
            if (this.presetId < 0)
            {
                throw new Error("Forbidden value (" + this.presetId + ") on element of InventoryPresetUseMessage.presetId.");
            }
            return;
        }// end function

    }
}
