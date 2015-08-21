/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:33
 */
package com.trembit.androidStageTextUtil.events {
	import flash.events.Event;

	public class AndroidStageTextUtilEvent extends Event {

		public function AndroidStageTextUtilEvent(type:String, bubbles:Boolean, cancelable:Boolean) {
			super(type, bubbles, cancelable);
		}
	}
}
