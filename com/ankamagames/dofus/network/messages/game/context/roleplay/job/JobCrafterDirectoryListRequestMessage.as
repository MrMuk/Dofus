package com.ankamagames.dofus.network.messages.game.context.roleplay.job
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class JobCrafterDirectoryListRequestMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var jobId:uint = 0;
        public static const protocolId:uint = 6047;

        public function JobCrafterDirectoryListRequestMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 6047;
        }// end function

        public function initJobCrafterDirectoryListRequestMessage(param1:uint = 0) : JobCrafterDirectoryListRequestMessage
        {
            this.jobId = param1;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.jobId = 0;
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
            this.serializeAs_JobCrafterDirectoryListRequestMessage(param1);
            return;
        }// end function

        public function serializeAs_JobCrafterDirectoryListRequestMessage(param1:IDataOutput) : void
        {
            if (this.jobId < 0)
            {
                throw new Error("Forbidden value (" + this.jobId + ") on element jobId.");
            }
            param1.writeByte(this.jobId);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_JobCrafterDirectoryListRequestMessage(param1);
            return;
        }// end function

        public function deserializeAs_JobCrafterDirectoryListRequestMessage(param1:IDataInput) : void
        {
            this.jobId = param1.readByte();
            if (this.jobId < 0)
            {
                throw new Error("Forbidden value (" + this.jobId + ") on element of JobCrafterDirectoryListRequestMessage.jobId.");
            }
            return;
        }// end function

    }
}
