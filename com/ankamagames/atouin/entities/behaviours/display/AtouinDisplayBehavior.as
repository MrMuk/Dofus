package com.ankamagames.atouin.entities.behaviours.display
{
   import com.ankamagames.jerakine.entities.behaviours.IDisplayBehavior;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.logger.Log;
   import flash.utils.getQualifiedClassName;
   import com.ankamagames.jerakine.entities.interfaces.IDisplayable;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   import com.ankamagames.atouin.managers.EntitiesDisplayManager;
   import com.ankamagames.jerakine.utils.errors.SingletonError;
   
   public class AtouinDisplayBehavior extends Object implements IDisplayBehavior
   {
      
      public function AtouinDisplayBehavior() {
         super();
         if(_self != null)
         {
            throw new SingletonError("A singleton class shouldn\'t be instancied directly!");
         }
         else
         {
            return;
         }
      }
      
      protected static const _log:Logger;
      
      private static var _self:AtouinDisplayBehavior;
      
      public static function getInstance() : AtouinDisplayBehavior {
         if(_self == null)
         {
            _self = new AtouinDisplayBehavior();
         }
         return _self;
      }
      
      public function display(displayable:IDisplayable, strata:uint = 0) : void {
         var entity:IEntity = displayable as IEntity;
         EntitiesManager.getInstance().addAnimatedEntity(entity.id,entity,strata);
      }
      
      public function remove(entity:IDisplayable) : void {
         EntitiesManager.getInstance().removeEntity((entity as IEntity).id);
      }
      
      public function getAbsoluteBounds(entity:IDisplayable) : IRectangle {
         return EntitiesDisplayManager.getInstance().getAbsoluteBounds(entity);
      }
   }
}
