package com.flashartofwar.boxmodel.events {
	import flash.events.Event;

	public class DisplayEvent extends Event
	{
		public static const DRAW : String = "draw";
		public static const ADD_CHILD : String = "addChild";
		public static const REMOVE_CHILD : String = "removeChild";

		public function DisplayEvent(type : String, bubbles : Boolean = true, cancelable : Boolean = true)
		{
			super( type, bubbles, cancelable );
		}
	}
}