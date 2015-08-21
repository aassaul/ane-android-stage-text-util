/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:33
 */
package com.trembit.androidStageTextUtil.events {
	import flash.events.Event;

	public final class AndroidStageTextUtilEvent extends Event {

		public static const TEXT_COMPONENT_READY:String = "textComponentReady";

		private var _input:*;

		public function get input():*{
			return _input;
		}

		public function AndroidStageTextUtilEvent(eventType:String, input:*) {
			super(eventType, false, false);
			_input = input;
		}

		override public function clone():Event {
			return new AndroidStageTextUtilEvent(type, input);
		}
	}
}
