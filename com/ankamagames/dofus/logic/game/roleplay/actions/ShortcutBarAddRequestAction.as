package com.ankamagames.dofus.logic.game.roleplay.actions
{
    import com.ankamagames.jerakine.handlers.messages.*;

    public class ShortcutBarAddRequestAction extends Object implements Action
    {
        public var barType:uint;
        public var id:uint;
        public var slot:uint;

        public function ShortcutBarAddRequestAction()
        {
            return;
        }// end function

        public static function create(param1:uint, param2:uint, param3:uint) : ShortcutBarAddRequestAction
        {
            var _loc_4:* = new ShortcutBarAddRequestAction;
            new ShortcutBarAddRequestAction.barType = param1;
            _loc_4.id = param2;
            _loc_4.slot = param3;
            return _loc_4;
        }// end function

    }
}
