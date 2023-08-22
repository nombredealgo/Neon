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
	
	public class muerte extends Sprite
	{
		private var bgmuerte:Image;
		
		
		private var reBtn:Button;
		private var tryBtn:Button;
		[Embed(source="../audio/derrota.mp3")]
		public var MySound : Class;    
		public var soundder : Sound;
		private var soundchanel3:SoundChannel;
		private var nivel:int;
		
		public function muerte(nivel:int)
		{
			super();
			soundder = (new MySound) as Sound;         
			soundchanel3 = soundder.play(0,999);
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.nivel = nivel;
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("muerte screen initialized");
			
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bgmuerte = new Image(Assets.getTexture("muerto"));
			this.addChild(bgmuerte);
		
			reBtn = new Button(Assets.getTexture("reset"));
			reBtn.x = 360;
			reBtn.y = 700;
			this.addChild(reBtn);
			
			tryBtn = new Button(Assets.getTexture("tryagain"));
			tryBtn.x = 350;
			tryBtn.y = 600;
			this.addChild(tryBtn)
			
			this.addEventListener(Event.TRIGGERED, onResetClick);
		}
		
		private function onResetClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			
			if((buttonClicked as Button) == reBtn)
			{
				soundchanel3.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "inicio"}, true));
			}
			
			if((buttonClicked as Button) == tryBtn)
			{
				if (nivel == 1){
				soundchanel3.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, { id: "nivel1" },  true));
				}
				if (nivel == 2){
				soundchanel3.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, { id: "nivel2" },  true));
				}
				if (nivel == 3){
				soundchanel3.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, { id: "nivel3" },  true));
				}
				
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