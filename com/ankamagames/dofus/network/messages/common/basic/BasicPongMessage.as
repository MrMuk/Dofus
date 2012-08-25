package com.ankamagames.dofus.network.messages.common.basic
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class BasicPongMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var quiet:Boolean = false;
        public static const protocolId:uint = 183;

        public function BasicPongMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 183;
        }// end function

        public function initBasicPongMessage(param1:Boolean = false) : BasicPongMessage
        {
            this.quiet = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.quiet = false;
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
            this.serializeAs_BasicPongMessage(param1);
            return;
        }// end function

        public function serializeAs_BasicPongMessage(param1:IDataOutput) : void
        {
            param1.writeBoolean(this.quiet);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_BasicPongMessage(param1);
            return;
        }// end function

        public function deserializeAs_BasicPongMessage(param1:IDataInput) : void
        {
            this.quiet = param1.readBoolean();
            return;
        }// end function

    }
}
