package com.ankamagames.dofus.types.characteristicContextual
{
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.logger.Log;
   import flash.utils.getQualifiedClassName;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import com.ankamagames.berilia.managers.EmbedFontManager;
   
   public class TextContextual extends CharacteristicContextual
   {
      
      public function TextContextual() {
         super();
      }
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(TextContextual));
      
      private var _tText:String;
      
      private var _text:TextField;
      
      private var _textFormat:TextFormat;
      
      public function get text() : String {
         return this._tText;
      }
      
      public function set text(param1:String) : void {
         this._tText = param1;
      }
      
      public function get textFormat() : TextFormat {
         return this._textFormat;
      }
      
      public function set textFormat(param1:TextFormat) : void {
         this._textFormat = param1;
      }
      
      public function finalize() : void {
         this._text = new TextField();
         this._text.selectable = false;
         this._text.defaultTextFormat = this._textFormat;
         this._text.setTextFormat(this._textFormat);
         if(EmbedFontManager.getInstance().isEmbed(this._textFormat.font))
         {
            this._text.embedFonts = true;
         }
         this._text.text = this._tText;
         this._text.width = this._text.textWidth + 5;
         this._text.height = this._text.textHeight;
         addChild(this._text);
      }
   }
}
