package com.ankamagames.dofus.network.messages.game.friend
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class IgnoredAddFailureMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var reason:uint = 0;
        public static const protocolId:uint = 5679;

        public function IgnoredAddFailureMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 5679;
        }// end function

        public function initIgnoredAddFailureMessage(param1:uint = 0) : IgnoredAddFailureMessage
        {
            this.reason = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.reason = 0;
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
            this.serializeAs_IgnoredAddFailureMessage(param1);
            return;
        }// end function

        public function serializeAs_IgnoredAddFailureMessage(param1:IDataOutput) : void
        {
            param1.writeByte(this.reason);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_IgnoredAddFailureMessage(param1);
            return;
        }// end function

        public function deserializeAs_IgnoredAddFailureMessage(param1:IDataInput) : void
        {
            this.reason = param1.readByte();
            if (this.reason < 0)
            {
                throw new Error("Forbidden value (" + this.reason + ") on element of IgnoredAddFailureMessage.reason.");
            }
            return;
        }// end function

    }
}
