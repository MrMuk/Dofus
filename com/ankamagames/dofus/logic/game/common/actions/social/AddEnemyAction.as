﻿package com.ankamagames.dofus.logic.game.common.actions.social
{
    import com.ankamagames.jerakine.handlers.messages.Action;

    public class AddEnemyAction implements Action 
    {

        public var name:String;


        public static function create(name:String):AddEnemyAction
        {
            var a:AddEnemyAction = new (AddEnemyAction)();
            a.name = name;
            return (a);
        }


    }
}//package com.ankamagames.dofus.logic.game.common.actions.social

