package events
{
	import starling.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		public var params:Object;
		public var nivel:int;
		
		public function NavigationEvent(type:String,nivel:int, _params:Object = null,  bubbles:Boolean=false)
		{
			super(type, bubbles);
			this.params = _params;
			this.nivel = nivel;
		}
	}
}