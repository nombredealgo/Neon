package screens
{
	import com.greensock.TweenLite;

	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class Controles extends Sprite
	{
		private var ptcontrol:Image;
		private var mainBtn:Button;
		[Embed(source="../audio/ctrlTheme.mp3")]
		public var MySound : Class;    
		public var soundmen : Sound;
		private var soundchanel5:SoundChannel;
	
	
		
		public function Controles()
		{
			super();
			soundmen = (new MySound) as Sound;         
			soundchanel5 = soundmen.play(0,999);
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Controles screen initialized");
			
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			ptcontrol = new Image(Assets.getTexture("ptctrl"));
			this.addChild(ptcontrol);
			ptcontrol.y = -200;
		
			mainBtn = new Button(Assets.getTexture("botonyw"));
			mainBtn.x = 180;
			mainBtn.y = 670;
			this.addChild(mainBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainClick);
		}
		
		private function onMainClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if((buttonClicked as Button) == mainBtn)
			{
				soundchanel5.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "inicio"}, true));
			}
		}
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			
		}
		
		public function initialize():void
		{
			this.visible = true;
		
		}
	}
}