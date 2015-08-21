/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidStageTextUtil {
	import com.trembit.androidStageTextUtil.events.AndroidStageTextUtilEvent;

	import flash.display.Stage;

	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.utils.setTimeout;

	public class AndroidStageTextUtil extends EventDispatcher implements IAndroidStageTextUtil{

		private var extContext:ExtensionContext;
		private var currentInput:*;
		private var currentCodePoints:Vector.<int>;

		public function AndroidStageTextUtil() {
			extContext = ExtensionContext.createExtensionContext("com.trembit.extension.AndroidStageTextUtil", null);
			extContext.addEventListener(StatusEvent.STATUS, onStatus);
		}

		public function dispose():void {
			extContext.dispose();
		}

		public function setTextToTextInput(text:String, input:*):void {
			text ||= "";
			var codePoints:Vector.<int> = new Vector.<int>(text.length, true);
			var l:int = text.length;
			for(var i:int = 0; i < l; i++) {
				codePoints[i] = text.charCodeAt(i);
			}
			this.currentInput = input;
			this.currentCodePoints = codePoints;
			var stage:Stage = currentInput.stage;
			stage.focus = null;
			currentInput.setFocus();
			setTimeout(performSetText, 50);
		}

		private function performSetText():void{
			var stage:Stage = currentInput.stage;
			extContext.call("setTextToFocusedInput", currentCodePoints);
		}

		private function onStatus(event:StatusEvent):void {
			switch(event.code){
				case "TextComponentReady":
					dispatchEvent(new AndroidStageTextUtilEvent(AndroidStageTextUtilEvent.TEXT_COMPONENT_READY, currentInput));
					currentInput = null;
					break;
			}
		}
	}
}
