/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidStageTextUtil {

	import com.trembit.androidStageTextUtil.events.AndroidStageTextUtilEvent;

	import flash.events.EventDispatcher;

	public class AndroidStageTextUtil extends EventDispatcher implements IAndroidStageTextUtil{
		public function dispose():void {}

		public function setTextToTextInput(text:String, input:*):void {
			input.setFocus();
			input.text = text;
			dispatchEvent(new AndroidStageTextUtilEvent(AndroidStageTextUtilEvent.TEXT_COMPONENT_READY, input));
		}
	}
}
