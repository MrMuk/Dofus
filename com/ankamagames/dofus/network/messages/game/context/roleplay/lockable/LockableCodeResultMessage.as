﻿package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable
{
    import com.ankamagames.jerakine.network.NetworkMessage;
    import com.ankamagames.jerakine.network.INetworkMessage;
    import flash.utils.ByteArray;
    import com.ankamagames.jerakine.network.CustomDataWrapper;
    import com.ankamagames.jerakine.network.ICustomDataOutput;
    import com.ankamagames.jerakine.network.ICustomDataInput;

    [Trusted]
    public class LockableCodeResultMessage extends NetworkMessage implements INetworkMessage 
    {

        public static const protocolId:uint = 5672;

        private var _isInitialized:Boolean = false;
        public var result:uint = 0;


        override public function get isInitialized():Boolean
        {
            return (this._isInitialized);
        }

        override public function getMessageId():uint
        {
            return (5672);
        }

        public function initLockableCodeResultMessage(result:uint=0):LockableCodeResultMessage
        {
            this.result = result;
            this._isInitialized = true;
            return (this);
        }

        override public function reset():void
        {
            this.result = 0;
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
            this.serializeAs_LockableCodeResultMessage(output);
        }

        public function serializeAs_LockableCodeResultMessage(output:ICustomDataOutput):void
        {
            output.writeByte(this.result);
        }

        public function deserialize(input:ICustomDataInput):void
        {
            this.deserializeAs_LockableCodeResultMessage(input);
        }

        public function deserializeAs_LockableCodeResultMessage(input:ICustomDataInput):void
        {
            this.result = input.readByte();
            if (this.result < 0)
            {
                throw (new Error((("Forbidden value (" + this.result) + ") on element of LockableCodeResultMessage.result.")));
            };
        }


    }
}//package com.ankamagames.dofus.network.messages.game.context.roleplay.lockable

