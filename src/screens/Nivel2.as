package screens
{
	import screens.Welcome
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.display.Image;	
	import starling.textures.Texture;
	import starling.events.KeyboardEvent;
	import starling.events.Event;
	import starling.textures.TextureAtlas;	
	import starling.core.Starling;
	import events.NavigationEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class Nivel2 extends Sprite 
	{			
		private var grabplat:int = 0;
		private var aDown:Boolean = false ;
		private var dDown:Boolean = false ;
		private var wDown:Boolean = false ;
		private var grav:int = 0;
		private var floor:int = 800;
		private var onBlock:int = -1;
		private var espadaactiva:Boolean = false;
		private var enemigomuerto1:Boolean = false;		
		private var enemigomuerto3:Boolean = false;
		private var runing:Boolean = false;
		private var plataformamov:Boolean = false;
		
		[Embed(source="../media/fondog2.png")]//Bloque del suelo
		public static const Fondo:Class;
		
		private var bitmap9:Bitmap = new Fondo();
		private var texture9:Texture = Texture.fromBitmap(new Fondo());
		
		private var fondo:Image = new Image(texture9);	
		
		
		//codigo de la protagonista!!
		
		private var image:MovieClip;
		private var corriendo:MovieClip;
		private var espada:MovieClip;
		
		
		[Embed(source="../media/idle.xml", mimeType="application/octet-stream")]		
		public static const IdleXML:Class;
		
		[Embed(source = "../media/idle.png")]
		private static const Idle:Class;	
		
		
		private var bitmap:Bitmap = new Idle();
		
		private var texture:Texture = Texture.fromBitmap(bitmap);
		
		private var xml:XML = XML(new IdleXML());
		
		private var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
		
		private var frames:Vector.<Texture> = sTextureAtlas.getTextures("protaidle");	
		private var frames2:Vector.<Texture> = sTextureAtlas.getTextures("corriendo");	
		private var frames3:Vector.<Texture> = sTextureAtlas.getTextures("espadamov");	
		
		//musica
		
		[Embed(source = "../audio/montaña.mp3")]
		public var MySound : Class;    
		public var sound : Sound;
		private var soundchanel:SoundChannel;

		
		//codigo cerebros
		private var explosion1:MovieClip;
		
		private var explosion3:MovieClip;
		
		private var cerebro1:MovieClip;
		private var cerebro2:MovieClip;
		private var cerebro3:MovieClip;
		private var cerebro4:MovieClip;
		
		private var sentidoc1:int = 2;
		private var sentidoc2:int = 1;
		
		private var sentidoc3:int = 1;
		private var sentidoc4:int = 1;
		
		
		[Embed(source="../media/cerebro.xml", mimeType="application/octet-stream")]		
		public static const CerebroXML:Class;
		
		[Embed(source = "../media/cerebro.png")]
		private static const Cerebro:Class;	
		
		private var bitmapcerebro:Bitmap = new Cerebro();
		
		private var texturecerebro:Texture = Texture.fromBitmap(bitmapcerebro);
		
		private var cerebroxml:XML = XML(new CerebroXML());
		
		private var cTextureAtlas:TextureAtlas = new TextureAtlas(texturecerebro, cerebroxml);
		
		private var cerebroframes:Vector.<Texture> = cTextureAtlas.getTextures("cerebro");			
		private var cerebroframes2:Vector.<Texture> = cTextureAtlas.getTextures("explosion");
		
		//codigo moto
		
		
		private var proyectil:MovieClip;
		
		
		[Embed(source="../media/moto.xml", mimeType="application/octet-stream")]		
		public static const MotoXML:Class;
		
		[Embed(source = "../media/moto.png")]
		private static const Moto:Class;	
		
		private var bitmapmoto:Bitmap = new Moto();
		
		private var texturemoto:Texture = Texture.fromBitmap(bitmapmoto);
		
		private var motoxml:XML = XML(new MotoXML());
		
		private var mTextureAtlas:TextureAtlas = new TextureAtlas(texturemoto, motoxml);		
			
		private var proyectilframes:Vector.<Texture> = mTextureAtlas.getTextures("proyectil");
		
		
		//codigo dino
		
		private var dino1:MovieClip;
		
		
		[Embed(source="../media/dinocyborg.xml", mimeType="application/octet-stream")]		
		public static const dinocyborgXML:Class;
		
		[Embed(source = "../media/dinocyborg.png")]
		private static const dinocyborg:Class;	
		
		private var bitmapdino:Bitmap = new dinocyborg();
		
		private var texturedino:Texture = Texture.fromBitmap(bitmapdino);
		
		private var dinoxml:XML = XML(new dinocyborgXML());
		
		private var dTextureAtlas:TextureAtlas = new TextureAtlas(texturedino, dinoxml);
		
		private var dinoframes:Vector.<Texture> = dTextureAtlas.getTextures("dc");			
	
		
		
		//codigo bandera
		
		[Embed(source="../media/kawaiijena.png")]
		public static const bandera:Class;
		
		private var bitmap5:Bitmap = new bandera();
		private var texture5:Texture = Texture.fromBitmap(new bandera);
		
		private var bandera0:Image = new Image(texture5);	
		
		
				
		//codigo de los bloques!!	
 
		[Embed(source="../media/plataforma.png")]//Bloque del suelo
		public static const Block4:Class;
		public var sentidop1:int = 1;
		
		
		private var bitmap4:Bitmap = new Block4();
		private var texture4:Texture = Texture.fromBitmap(new Block4());
		
		private var plataforma1:Image = new Image(texture4);
		
		
		//ultimos bloques
		
		[Embed(source="../media/bloquefinal.png")]
		public static const Block3:Class;
		
		private var bitmap3:Bitmap = new Block3();
		private var texture3:Texture = Texture.fromBitmap(new Block3());
		
		private var block7:Image = new Image(texture3);		
		private var block8:Image = new Image(texture3);	
		private var block9:Image = new Image(texture3);	
		
		//codigo de los bloques!!	
 
		[Embed(source="../media/pinchos.png")]//Bloque del suelo
		public static const Pinchos:Class;
		
		private var bitmapincho:Bitmap = new Pinchos();
		private var texturepincho:Texture = Texture.fromBitmap(new Pinchos());
		
		private var pincho1:Image = new Image(texturepincho);
		private var pincho2:Image = new Image(texturepincho);	
		
		//codigo de los bloques!!	
 
		[Embed(source="../media/pinchos2.png")]//Bloque del suelo
		public static const Pinchos2:Class;
		
		private var bitmapincho2:Bitmap = new Pinchos2();
		private var texturepincho2:Texture = Texture.fromBitmap(new Pinchos2());
		
		private var pincho3:Image = new Image(texturepincho2);
		
		
					
		public function Nivel2() 
		{
	
			super();	
			
			sound = (new MySound) as Sound;         
			soundchanel = sound.play(0,999);
			
			fondo.x = 0;
			fondo.y = -25;
			addChild(fondo);	
			
			
			
			plataforma1.x = 200;
			plataforma1.y = 770;
			addChild(plataforma1);		
					
		
			block8.x =860;
			block8.y = 80;
			addChild(block8);	
			
			block9.x =860;
			block9.y = 400;
			addChild(block9);	
					
			block7.x = 0;
			block7.y = 770;
			addChild(block7);		
			
			pincho1.x = 600;
			pincho1.y = 50;
			addChild(pincho1);	
			
			pincho2.x = 300;
			pincho2.y = 50;
			addChild(pincho2);	
			
			pincho3.x = 450;
			pincho3.y = 210;
			addChild(pincho3);
			
			image = new MovieClip(frames, 2);			
			image.x = 25;
			image.y = 600;
			addChild(image);	
			Starling.juggler.add(image);
			
			corriendo = new MovieClip(frames2,8);
			corriendo.x = image.x;
			corriendo.y = floor;
			
			espada = new MovieClip(frames3,6);
			espada.x = image.x;
			espada.y = floor;
					
								
			cerebro1 = new MovieClip(cerebroframes,2);			
			cerebro1.x = 700;
			cerebro1.y = 700;
			addChild(cerebro1);	
			Starling.juggler.add(cerebro1);
			
			cerebro2 = new MovieClip(cerebroframes,2);			
			cerebro2.x = 200;
			cerebro2.y = 700;
			addChild(cerebro2);	
			Starling.juggler.add(cerebro2);			
			
			
			proyectil = new MovieClip(proyectilframes,6);			
			proyectil.x = 900;
			proyectil.y = 350;
			proyectil.scaleX = -1;
			addChild(proyectil);	
			Starling.juggler.add(proyectil);
			
			
			
			explosion1 = new MovieClip(cerebroframes2, 6);
			explosion1.loop = false;
			
			
			
			explosion3 = new MovieClip(cerebroframes2, 6);
			explosion3.loop = false;
						
			bandera0.x = 900;
			bandera0.y = 10;
			addChild(bandera0);
						
			
			dino1 = new MovieClip(dinoframes,4);			
			dino1.x = 870;
			dino1.y = 320;
			addChild(dino1);	
			Starling.juggler.add(dino1);	
			
			
			
			
			this.addEventListener(Event.ENTER_FRAME, checkStuff);
			this.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}	
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
			public function initialize():void
		{
			this.visible = true;
		}
		private function keyUp(e:KeyboardEvent):void 
		{	
			if (e.keyCode == 32) {	
				espadaactiva = false;
				Starling.juggler.remove(espada);
				removeChild(espada);
				addChild(image);	
				Starling.juggler.add(image);
				
				 }
		
			if (e.keyCode == 65){
				aDown = false;				
				Starling.juggler.remove(corriendo);
				removeChild(corriendo);
				image.visible = true;
				addChild(image);	
				Starling.juggler.add(image);
				runing = false;
				 }
				
			if (e.keyCode == 68){
				dDown = false;				
				Starling.juggler.remove(corriendo);
				removeChild(corriendo);
				image.visible = true;
				addChild(image);	
				Starling.juggler.add(image);
				runing = false;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			if ((e.keyCode == 87) && (image.y + image.height >= floor) && (runing == false)){ 
				image.visible = true;
				grav -= 18;				
			}
			
			
			
			if 	(image.y + image.height < floor) {
				if (e.keyCode == 65) {
					runing = true;
					aDown = true; }
				if (e.keyCode == 68) {
					runing = true;
					dDown = true;}
			}	
			
			else{
				if (e.keyCode == 65){
					
					
					runing = true;
					corriendo.scaleX = -1;
					image.visible = false;
					
					espada.scaleX = -1;					
					
					
					corriendo.x = image.x + corriendo.width ;
					corriendo.y = image.y;
					addChild(corriendo)
					Starling.juggler.add(corriendo);
					Starling.juggler.remove(image);
					removeChild(image);
					aDown = true;
				}
				if (e.keyCode == 68) {
					
					runing = true;	
					image.visible = false;
					
					espada.scaleX = 1;
					
					corriendo.scaleX = 1
					corriendo.x = image.x;
					corriendo.y = image.y;
					addChild(corriendo)
					Starling.juggler.add(corriendo);
					Starling.juggler.remove(image);
					removeChild(image);
					dDown = true;
					
					}
					
					if (e.keyCode == 32) {
						espadaactiva = true;
						if (espada.scaleX == -1) {
							espada.x = image.x + espada.width -70;
						}
						else {
							espada.x = image.x;
						}						
						espada.y = image.y;
						addChild(espada)
						Starling.juggler.add(espada);
						Starling.juggler.remove(image);
						removeChild(image);
					}
						
			}				
					
		}
			
		
		
		
		
		private function checkStuff(e:Event):void 
		{			
			
		
			check_object(image, block7, 7);
			check_object(image, block8, 8);
			
			plataformas(image, plataforma1);		
			

					
			
			if (enemigomuerto1 != true) {
				
				proyectilmovimiento();
				mueres(image, proyectil);	
			}
			else {proyectil.visible = false;}			
			
			
			
			cerebro1movimiento();
			cerebro2movimiento();
			
			
			if (plataformamov == true){
			plataforma1movimiento();}
			
			victoria (corriendo, bandera0);			
			victoria (image, bandera0);
			
			mueres(image, proyectil);	
			
			pinchos(image, pincho1);
			pinchos(image, pincho2);
			pinchos(image, pincho3);
			
			mueres(image, cerebro1);	
								
			mueres(image, cerebro2);			
			
					
						
			if (enemigomuerto1 != true) {
				
				enemigo(espada, dino1, explosion1);				
				mueres(image, dino1);			
				
			}		
			
			
			
			if (enemigo(espada, dino1, explosion1) == true) {
				
				enemigomuerto1 = true;
			}
			
			
			
			if (aDown) {		
				
				image.x -= 6;
				corriendo.x = image.x + image.width;
			}	
			
			if (dDown) {
				
				corriendo.x = image.x;
				image.x += 6;
				}			
			
			
			adjust();				
	
					
		}
		
		public function proyectilmovimiento():void {
			
			if (proyectil.x > 0) {
				proyectil.x -= 4;				
			}
			else {
				proyectil.x =890;
				
			}
						
		}
		
				
		public function cerebro1movimiento():void {
			
			if (sentidoc1 == 1) {
				cerebro1.x -= 4;
				if (cerebro1.x < 500) {
					sentidoc1 = 2;
				}
			}
			
			if (sentidoc1 == 2) {
				cerebro1.y -= 4;
				if (cerebro1.y < 500) {
					sentidoc1 = 3;
				}
			}			
									
			if (sentidoc1 == 3) {
				cerebro1.x += 4;
				if (cerebro1.x > 700) {
					sentidoc1 = 4;
				}
			}
			if (sentidoc1 == 4) {
				cerebro1.y += 4;
				if (cerebro1.y > 700) {
					sentidoc1 = 1;
				}
			}
		}
		
		
		
		public function cerebro2movimiento():void {
			
			if (sentidoc2 == 1) {
				cerebro2.x += 4;
				if (cerebro2.x >400) {
					sentidoc2 = 2;
				}
			}
			
			if (sentidoc2 == 2) {
				cerebro2.y -= 4;
				if (cerebro2.y < 500) {
					sentidoc2 = 3;
				}
			}			
									
			if (sentidoc2 == 3) {
				cerebro2.x -= 4;
				if (cerebro2.x < 200) {
					sentidoc2 = 4;
				}
			}
			if (sentidoc2 == 4) {
				cerebro2.y += 4;
				if (cerebro2.y > 700) {
					sentidoc2 = 1;
				}
			}
		}
		
		
		
		public function plataforma1movimiento():void {
			
			
			if (sentidop1 == 1) {
				plataforma1.x += 1;
				if (plataforma1.x > 750) {
					sentidop1 = 2;
				}
			}
			
			if (sentidop1 == 2) {
				plataforma1.y -= 1;
				if (plataforma1.y < 600) {
					sentidop1 = 3;
				}
				
			}
			
			if (sentidop1 == 3) {
				plataforma1.x -= 1;
				if (plataforma1.x < 100) {
					sentidop1 = 4;
				}
				
			}
			if (sentidop1 == 4) {
				plataforma1.y -= 1;
				if (plataforma1.y < 400) {
					sentidop1 = 5;
				}
				
			}
			
				if (sentidop1 == 5) {
				plataforma1.x += 1;
				if (plataforma1.x > 750) {
					sentidop1 = 6;
				}
			}
			
			if (sentidop1 == 6) {
				plataforma1.y -= 1;
				if (plataforma1.y < 300) {
					sentidop1 = 7;
				}
				
			}
			
			if (sentidop1 == 7) {
				plataforma1.x -= 1;
				if (plataforma1.x < 100) {
					sentidop1 = 8;
				}
				
			}
			if (sentidop1 == 8) {
				plataforma1.y -= 1;
				if (plataforma1.y < 100) {
					sentidop1 = 9;
				}
				
			}
			
			if (sentidop1 == 9) {
				plataforma1.x += 1;
				if (plataforma1.x > 750) {
					sentidop1 = 10;
				}
			}
			
			if (sentidop1 == 10) {
				grabplat ++;
				plataforma1.y += grabplat;
				if (plataforma1.y > 680) {
					removeChild(plataforma1);
				}
			}
		}
		
			
		
		public function adjust():void {
			
			image.y += grav;
			corriendo.y = image.y;
			
			if (image.y + image.height < floor) {
				grav ++;				
			}
			
				else {
				grav = 0;
				image.y = floor - image.height;
				
			}
			
			if (image.x < 0 )
				image.x = image.width / 9 ;
				
			if (image.x + image.width > 1000 )
				image.x = 1000 - image.width ;
				
			if (image.y > 800) {
				
				soundchanel.stop();
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,2, {id: "muerte"}, true));
				 
			 }
			
		}
		
		public function plataformas(Personaje:MovieClip , Block:Image):void 
		{
			if  ((Personaje.bounds.intersects(Block.bounds) == true)) {
				
				floor = Block.y + 15;
				plataformamov = true;
			}			
			
			else { if ( onBlock == -1) { floor = 1000 }  ; }
			
		}
				
		public function check_object(Personaje:MovieClip , Block:Image ,place:int):void 
		{
			
		
			//Estos dos ifs son para que no traspase el bloque por los lados.
			
			if ((Personaje.x  > Block.x - Block.width/7) && (Personaje.x + Personaje.width /2 < Block.x ) && (Math.abs((Personaje.y + Personaje.height/2) - (Block.y + Block.height/2) ) < Block.height / 2))
				Personaje.x = Block.x - Personaje.width ;
			
			
			if ((Personaje.x + Personaje.width > Block.x + Block.width -60 ) && (Personaje.x < Block.x + Block.width )&&(Math.abs((Personaje.y + Personaje.height/2) - (Block.y + Block.height/2)) < Block.height / 2))
				Personaje.x = Block.x + Block.width ; 			
			
		
				
			//Estos dos ifs son para que el presonaje este encima del bloque.
			
			if ((Math.abs((Personaje.x + Personaje.width/2)- (Block.x + Block.width/2)) < Block.width/2 + Personaje.width/2 ) && ((Personaje.y + Personaje.height) < Block.y) && ( floor > Block.y ) && (onBlock != place))
			{
				
				floor = Block.y ;
				onBlock = place;
			}			
			
			if ((Math.abs((Personaje.x + Personaje.width/2) - (Block.x + Block.width/2)) >= Block.width/2 + Personaje.width/2 ) && (onBlock == place))
			{
				onBlock = -1;
				floor = 1000;
			}			
			
			//esto hace que no pueda traspasar el bloque desde abajo.
			
			if ((Personaje.y < Block.y + Block.height ) && ((Personaje.y + Personaje.height/2) > (Block.y + Block.height/2)) && (Math.abs((Personaje.x + Personaje.width/2) - (Block.x + Block.width/2)) < Block.width/2  + Personaje.width/2 ))
				Personaje.y  = Block.y + Block.height ;
				
			
			
		
		}
		
		public function check_object2(Personaje:MovieClip , Block:Image ,place:int):void 
		{
			//Estos dos ifs son para que no traspase el bloque por los lados.
			
			if ((Personaje.x  > Block.x - Block.width/22) && (Personaje.x + Personaje.width /2 < Block.x ) && (Math.abs((Personaje.y + Personaje.height/2) - (Block.y + Block.height/2) ) < Block.height / 2))
				Personaje.x = Block.x - Personaje.width ;
			
			
			if ((Personaje.x + Personaje.width > Block.x + Block.width ) && (Personaje.x < Block.x + Block.width )&&(Math.abs((Personaje.y + Personaje.height/2) - (Block.y + Block.height/2)) < Block.height / 2))
				Personaje.x = Block.x + Block.width; 			
				
				
			//Estos dos ifs son para que el presonaje este encima del bloque.
			
			if ((Math.abs((Personaje.x + Personaje.width/2)- (Block.x + Block.width/2)) < Block.width/2 + Personaje.width/2 ) && ((Personaje.y + Personaje.height) < Block.y) && ( floor > Block.y ) && (onBlock != place))
			{
				
				floor = Block.y;
				onBlock = place;
			}			
			
			if ((Math.abs((Personaje.x + Personaje.width/2) - (Block.x + Block.width/2)) >= Block.width/2 + Personaje.width/2 ) && (onBlock == place))
			{
				onBlock = -1;
				floor = 1000;
			}			
			
			//esto hace que no pueda traspasar el bloque desde abajo.
			
			if ((Personaje.y < Block.y + Block.height ) && ((Personaje.y + Personaje.height/2) > (Block.y + Block.height/2)) && (Math.abs((Personaje.x + Personaje.width/2) - (Block.x + Block.width/2)) < Block.width/2  + Personaje.width/2 ))
				Personaje.y  = Block.y + Block.height ;
				
			
			
		
		}
		
		public function enemigo(Personaje:MovieClip , enemigo:MovieClip,explosion:MovieClip):Boolean 
		{
	
			if ((Personaje.bounds.intersects(enemigo.bounds) == true)) {				 
				 
				
				
					removeChild(enemigo);
					Starling.juggler.remove(enemigo);
					
					explosion.x = enemigo.x ;
					explosion.y = enemigo.y;
					
					addChild(explosion);				
					Starling.juggler.add(explosion);			
					
					explosion.play();
					
					return true;		
				 
				 
			}
			
			else return false;
			
		}
		
					
		public function mueres(Personaje:MovieClip , enemigo:MovieClip):void 
		{
		 if ((Personaje.bounds.intersects(enemigo.bounds) == true)) {	
				
				soundchanel.stop();
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,2, {id: "muerte"}, true));
				 
			 }
		}
		
		public function pinchos(Personaje:MovieClip , enemigo:Image):void 
		{
		 if ((Personaje.bounds.intersects(enemigo.bounds) == true)) {	
				
				soundchanel.stop();
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,2, {id: "muerte"}, true));
				 
			 }
		}
		
		public function victoria(Personaje:MovieClip , bandera:Image):void 
		{
			 if (Personaje.bounds.intersects(bandera.bounds) == true) {				 
				
				soundchanel.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, 0,{id: "nivel3"}, true));
			 }
		
		}
		
	}

	

}
		