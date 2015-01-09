﻿package com.ankamagames.tiphon.types
{
    import com.ankamagames.jerakine.managers.OptionManager;

    public dynamic class TiphonOptions extends OptionManager 
    {

        public function TiphonOptions():void
        {
            super("tiphon");
            add("pointsOverhead", 2);
            add("auraMode", 3);
            add("alwaysShowAuraOnFront", false);
            add("creaturesMode", 20);
        }

    }
}//package com.ankamagames.tiphon.types

