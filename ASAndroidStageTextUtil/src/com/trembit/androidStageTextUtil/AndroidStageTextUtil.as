/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidStageTextUtil {
	import com.trembit.androidStageTextUtil.events.AndroidStageTextUtilEvent;

	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.net.URLRequest;

	public class AndroidStageTextUtil extends EventDispatcher implements IAndroidStageTextUtil{

		private var extContext:ExtensionContext;

		public function AndroidStageTextUtil() {
			extContext = ExtensionContext.createExtensionContext("com.trembit.extension.AndroidStageTextUtil", null);
			extContext.addEventListener(StatusEvent.STATUS, onStatus);
		}

		public function dispose():void {
			extContext.dispose();
		}

		private function onStatus(event:StatusEvent):void {
			var message:String = event.level;
			switch(event.code){

			}
		}
	}
}
