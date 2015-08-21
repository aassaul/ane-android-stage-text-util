/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidStageTextUtil {

	import flash.events.IEventDispatcher;

	[Event(type="com.trembit.androidStageTextUtil.events.AndroidStageTextUtilEvent", name="textComponentReady")]
	public interface IAndroidStageTextUtil extends IEventDispatcher {
		function dispose():void;
		function setTextToTextInput(text:String, input:*):void;
	}
}
