package com.ankamagames.dofus.network.messages.game.basic
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class SequenceNumberMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var number:uint = 0;
        public static const protocolId:uint = 6317;

        public function SequenceNumberMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 6317;
        }// end function

        public function initSequenceNumberMessage(param1:uint = 0) : SequenceNumberMessage
        {
            this.number = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.number = 0;
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
            this.serializeAs_SequenceNumberMessage(param1);
            return;
        }// end function

        public function serializeAs_SequenceNumberMessage(param1:IDataOutput) : void
        {
            if (this.number < 0 || this.number > 65535)
            {
                throw new Error("Forbidden value (" + this.number + ") on element number.");
            }
            param1.writeShort(this.number);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_SequenceNumberMessage(param1);
            return;
        }// end function

        public function deserializeAs_SequenceNumberMessage(param1:IDataInput) : void
        {
            this.number = param1.readUnsignedShort();
            if (this.number < 0 || this.number > 65535)
            {
                throw new Error("Forbidden value (" + this.number + ") on element of SequenceNumberMessage.number.");
            }
            return;
        }// end function

    }
}
