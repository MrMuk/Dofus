﻿package com.ankamagames.dofus.network.messages.game.context.roleplay
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class ChangeMapMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 221;

        private var _isInitialized:Boolean = false;
        public var mapId:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (221);
        }

        public function initChangeMapMessage(mapId:uint=0):ChangeMapMessage
        {
            this.mapId = mapId;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.mapId = 0;
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
            this.serializeAs_ChangeMapMessage(output);
        }

        public function serializeAs_ChangeMapMessage(output:ICustomDataOutput):void
        {
            if (this.mapId < 0)
            {
                throw (new Error((("Forbidden value (" + this.mapId) + ") on element mapId.")));
            };
            output.writeInt(this.mapId);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_ChangeMapMessage(input);
        }

        public function deserializeAs_ChangeMapMessage(input:ICustomDataInput):void
        {
            this.mapId = input.readInt();
            if (this.mapId < 0)
            {
                throw (new Error((("Forbidden value (" + this.mapId) + ") on element of ChangeMapMessage.mapId.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.roleplay

