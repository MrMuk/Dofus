﻿package com.ankamagames.dofus.network.messages.game.chat.channel
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ChannelEnablingMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 890;

        private var _isInitialized:Boolean = false;
        public var channel:uint = 0;
        public var enable:Boolean = false;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (890);
        }

        public function initChannelEnablingMessage(channel:uint=0, enable:Boolean=false):ChannelEnablingMessage
        {
            this.channel = channel;
            this.enable = enable;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.channel = 0;
            this.enable = false;
            this._isInitialized = false;
        }

        override public function pack(output:ICustomDataOutput):void
        {
            var data:ByteArray = new ByteArray();
            this.serialize(new CustomDataWrapper(data));
            writePacket(output, this.getMessageId(), data);
        }

        override public function unpack(input:ICustomDataInput, length:uint):void
        {
            this.deserialize(input);
        }

        public function serialize(output:ICustomDataOutput):void
        {
            this.serializeAs_ChannelEnablingMessage(output);
        }

        public function serializeAs_ChannelEnablingMessage(output:ICustomDataOutput):void
        {
            output.writeByte(this.channel);
            output.writeBoolean(this.enable);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ChannelEnablingMessage(input);
        }

        public function deserializeAs_ChannelEnablingMessage(input:ICustomDataInput):void
        {
            this.channel = input.readByte();
            if (this.channel < 0)
            {
                throw (new Error((("Forbidden value (" + this.channel) + ") on element of ChannelEnablingMessage.channel.")));
            };
            this.enable = input.readBoolean();
        }


    }
}//package com.ankamagames.dofus.network.messages.game.chat.channel

