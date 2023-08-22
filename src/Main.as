package
{   

	import screens.juegoensi;
	import screens.Welcome;
	import flash.display.StageScaleMode
	import flash.display.StageAlign;
	import net.hires.debug.Stats;
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.events.Event;
	import starling.events.*;
	import starling.core.Starling;
	import flash.geom.Rectangle;

	[SWF(frameRate="60", width="1000", height="800", backgroundColor="0x333333")]
	
	
	public class Main extends Sprite
	{
		private var stats:Stats;
		Starling.handleLostContext = true;
		private var myStarling:Starling;
	
		
		
		public function Main()
		{

	
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			
		
			
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
		
	
			myStarling = new Starling(Juego, stage, viewPortRectangle);
			
			

			myStarling.start();
			trace(stage.stageWidth);
			trace(stage.stageHeight);
		
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, onResize);
			
		}
		private function onResize(e:ResizeEvent):void
		{
			// set rectangle dimensions for viewPort:
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = e.width; viewPortRectangle.height = e.height
 
			// resize the viewport:
			Starling.current.viewPort = viewPortRectangle;
 
			// assign the new stage width and height:
			stage.stageWidth = e.width;
			stage.stageHeight = e.height;
		}
		
		
		
		
	}	
}