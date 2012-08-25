package com.ankamagames.dofus.network.messages.game.guild
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class GuildPaddockTeleportRequestMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var paddockId:int = 0;
        public static const protocolId:uint = 5957;

        public function GuildPaddockTeleportRequestMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 5957;
        }// end function

        public function initGuildPaddockTeleportRequestMessage(param1:int = 0) : GuildPaddockTeleportRequestMessage
        {
            this.paddockId = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.paddockId = 0;
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
            this.serializeAs_GuildPaddockTeleportRequestMessage(param1);
            return;
        }// end function

        public function serializeAs_GuildPaddockTeleportRequestMessage(param1:IDataOutput) : void
        {
            param1.writeInt(this.paddockId);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_GuildPaddockTeleportRequestMessage(param1);
            return;
        }// end function

        public function deserializeAs_GuildPaddockTeleportRequestMessage(param1:IDataInput) : void
        {
            this.paddockId = param1.readInt();
            return;
        }// end function

    }
}
