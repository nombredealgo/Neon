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
	
	public class Victoria extends Sprite
	{
		private var hasganado:Image;
	
		
		private var botonyw:Button;
		[Embed(source = "../audio/SpGf.mp3")]
		public var MySound : Class;    
		public var soundVic : Sound;
		private var soundchanel2:SoundChannel;

		
		public function Victoria()
		{
			super();
			soundVic = (new MySound) as Sound;         
			soundchanel2 = soundVic.play(0,999);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			
			
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("victoria screen initialized");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			hasganado = new Image(Assets.getTexture("hasganado"));
			this.addChild(hasganado);
		
			botonyw = new Button(Assets.getTexture("botonyw"));
			botonyw.x = 180;
			botonyw.y = 600;
			this.addChild(botonyw);
			
			this.addEventListener(Event.TRIGGERED, onMainMenu);
		}
		
		private function onMainMenu(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if((buttonClicked as Button) == botonyw)
			{
				soundchanel2.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, { id: "inicio" }, true));
				
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