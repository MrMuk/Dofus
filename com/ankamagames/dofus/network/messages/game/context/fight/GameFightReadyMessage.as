package com.ankamagames.dofus.network.messages.game.context.fight
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class GameFightReadyMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var isReady:Boolean = false;
        public static const protocolId:uint = 708;

        public function GameFightReadyMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 708;
        }// end function

        public function initGameFightReadyMessage(param1:Boolean = false) : GameFightReadyMessage
        {
            this.isReady = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.isReady = false;
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
            this.serializeAs_GameFightReadyMessage(param1);
            return;
        }// end function

        public function serializeAs_GameFightReadyMessage(param1:IDataOutput) : void
        {
            param1.writeBoolean(this.isReady);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_GameFightReadyMessage(param1);
            return;
        }// end function

        public function deserializeAs_GameFightReadyMessage(param1:IDataInput) : void
        {
            this.isReady = param1.readBoolean();
            return;
        }// end function

    }
}
