package com.ankamagames.dofus.network.messages.game.context.roleplay.quest
{
    import com.ankamagames.jerakine.network.*;
    import flash.utils.*;

    public class QuestStepValidatedMessage extends NetworkMessage implements INetworkMessage
    {
        private var _isInitialized:Boolean = false;
        public var questId:uint = 0;
        public var stepId:uint = 0;
        public static const protocolId:uint = 6099;

        public function QuestStepValidatedMessage()
        {
            return;
        }// end function

        override public function get isInitialized() : Boolean
        {
            return this._isInitialized;
        }// end function

        override public function getMessageId() : uint
        {
            return 6099;
        }// end function

        public function initQuestStepValidatedMessage(param1:uint = 0, param2:uint = 0) : QuestStepValidatedMessage
        {
            this.questId = param1;
            this.stepId = param2;
            this._isInitialized = true;
            return this;
        }// end function

        override public function reset() : void
        {
            this.questId = 0;
            this.stepId = 0;
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
            this.serializeAs_QuestStepValidatedMessage(param1);
            return;
        }// end function

        public function serializeAs_QuestStepValidatedMessage(param1:IDataOutput) : void
        {
            if (this.questId < 0 || this.questId > 65535)
            {
                throw new Error("Forbidden value (" + this.questId + ") on element questId.");
            }
            param1.writeShort(this.questId);
            if (this.stepId < 0 || this.stepId > 65535)
            {
                throw new Error("Forbidden value (" + this.stepId + ") on element stepId.");
            }
            param1.writeShort(this.stepId);
            return;
        }// end function

        public function deserialize(param1:IDataInput) : void
        {
            this.deserializeAs_QuestStepValidatedMessage(param1);
            return;
        }// end function

        public function deserializeAs_QuestStepValidatedMessage(param1:IDataInput) : void
        {
            this.questId = param1.readUnsignedShort();
            if (this.questId < 0 || this.questId > 65535)
            {
                throw new Error("Forbidden value (" + this.questId + ") on element of QuestStepValidatedMessage.questId.");
            }
            this.stepId = param1.readUnsignedShort();
            if (this.stepId < 0 || this.stepId > 65535)
            {
                throw new Error("Forbidden value (" + this.stepId + ") on element of QuestStepValidatedMessage.stepId.");
            }
            return;
        }// end function

    }
}
