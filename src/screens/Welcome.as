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
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		private var playBtn:Button;
		private var ctrlBtn:Button;
		private var lv1:Button;
		private var lv2:Button;
		private var lv3:Button;
		
		[Embed(source="../audio/menu.mp3")]
		public var MySound : Class;    
		public var soundmen : Sound;
		private var soundchanel4:SoundChannel;
		
		public function Welcome()
		{
			super();
			soundmen = (new MySound) as Sound;         
			soundchanel4 = soundmen.play(0,999);
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("welcome screen initialized");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
		
			playBtn = new Button(Assets.getTexture("WelcomePlayBtn"));
			playBtn.x = 420;
			playBtn.y = 700;
			this.addChild(playBtn);
			
			ctrlBtn = new Button(Assets.getTexture("controls"));
			ctrlBtn.x = 370;
			ctrlBtn.y = 680
			this.addChild(ctrlBtn);
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
			
			lv1 = new Button(Assets.getTexture("boton1"));
			lv1.x = 75;
			lv1.y = 300;
			this.addChild(lv1);
			
			lv2 = new Button(Assets.getTexture("boton2"));
			lv2.x = 75;
			lv2.y = 375;
			this.addChild(lv2);
			
			lv3 = new Button(Assets.getTexture("boton3"));
			lv3.x = 75;
			lv3.y = 450;
			this.addChild(lv3);
			
		}
		
		private function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if((buttonClicked as Button) == playBtn)
			{
				soundchanel4.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "nivel1"}, true));
			}
			if((buttonClicked as Button) == ctrlBtn)
			{
				
				soundchanel4.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "controles"}, true));
			}
			if((buttonClicked as Button) == lv1)
			{
				
				soundchanel4.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "nivel1"}, true));
			}
			if((buttonClicked as Button) == lv2)
			{
				
				soundchanel4.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "nivel2"}, true));
			}
			if((buttonClicked as Button) ==lv3)
			{
				
				soundchanel4.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "nivel3"}, true));
			}
				
		}
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, animation);
		}
		
		public function initialize():void
		{
			this.visible = true;

			this.addEventListener(Event.ENTER_FRAME, animation);
		}
		
		private function animation(event:Event):void
		{
			var currentDate:Date = new Date();
			
			playBtn.x = 420 + (Math.cos(currentDate.getTime() * 0.001) * 10);
			playBtn.y = 600 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			
			ctrlBtn.x = 370 + (Math.cos(currentDate.getTime() * 0.001) * 15);
			ctrlBtn.y = 680 + (Math.cos(currentDate.getTime() * 0.002) * 15);
		
		}
	}
}