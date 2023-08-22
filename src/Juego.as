package
{
	import events.NavigationEvent;
	import screens.Nivel2;
	import screens.Nivel3;
	
	import screens.juegoensi;
	import screens.Welcome;
	import screens.muerte;
	import screens.Victoria;
	import screens.Controles;
	
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Juego extends Sprite
	{
		private var screenWelcome:Welcome;
		private var screenjuegoensi:juegoensi;
		private var screenNivel2:Nivel2;
		private var screenNivel3:Nivel3;
		private var screenmuerte:muerte;
		private var screenVictoria:Victoria;
		private var screenControles:Controles;
		public function Juego()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialized!");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.initialize();
		}
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "nivel1":
					this.removeChild(screenmuerte);
					screenjuegoensi = new juegoensi();
					screenWelcome.disposeTemporarily();
					this.addChild(screenjuegoensi);
					screenjuegoensi.initialize();
					break;
				
				case "nivel2":
					this.removeChild(screenmuerte);
					this.removeChild(screenjuegoensi);
					screenNivel2 = new Nivel2();
					this.addChild(screenNivel2);
					screenNivel2.initialize();
					break;
					
				case "nivel3":
					
					this.removeChild(screenmuerte);
					this.removeChild(screenNivel2);
					screenNivel3 = new Nivel3();
					this.addChild(screenNivel3);
					screenNivel3.initialize();
					break;
					
				case "inicio":
					
					this.removeChild(screenVictoria);
					this.removeChild(screenmuerte);
					this.removeChild(screenControles);
					screenWelcome = new Welcome();
					this.addChild(screenWelcome);
					screenWelcome.initialize();
   
     
					break;
				case "controles":
					
					screenWelcome.disposeTemporarily();
					screenControles = new Controles();
					this.addChild(screenControles);
				
					break;
				case "muerte":
					
					this.removeChild(screenjuegoensi);
					this.removeChild(screenNivel2);
					this.removeChild(screenNivel3);
					screenmuerte = new muerte(event.nivel);
					this.addChild(screenmuerte);
				
					break;
					
				case "victoria":
					
					this.removeChild(screenNivel3);
					this.removeChild(screenNivel2);
					screenVictoria = new Victoria();
					this.addChild(screenVictoria);
					
					break;	
					
			}
		}
	}
}