package screens
{
	import screens.Welcome
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.display.Image;	
	import starling.display.*;
	import starling.textures.Texture;
	import starling.events.KeyboardEvent;
	import starling.events.Event;
	import starling.textures.TextureAtlas;	
	import starling.core.Starling;
	import starling.animation.Tween;
	import events.NavigationEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import starling.animation.Transitions;
	import flash.utils.Timer;
	
	
	public class Nivel3 extends Sprite 
	{			
		
		private var temporizador:Timer;
		private var bolaactiva:Boolean = false;
		private var laseractivo:Boolean = false;

		
		private var aDown:Boolean = false ;
		private var dDown:Boolean = false ;
		private var wDown:Boolean = false ;
		private var venam1:Boolean = false;
		private var venam2:Boolean = false;
		private var venam3:Boolean = false;
		private var venam4:Boolean = false;
		private var grav:int = 0;
		private var floor:int = 800;
		private var contadorvenas:int = 0;
		private var onBlock:int = -1;
		private var espadaactiva:Boolean = false;		
		private var runing:Boolean = false;
		[Embed(source="../media/cerebro.xml", mimeType="application/octet-stream")]		
		public static const CerebroXML:Class;
		
		[Embed(source = "../media/cerebro.png")]
		private static const Cerebro:Class;	
		
		private var bitmapcerebro:Bitmap = new Cerebro();
		
		private var texturecerebro:Texture = Texture.fromBitmap(bitmapcerebro);
		
		private var cerebroxml:XML = XML(new CerebroXML());
		
		private var cTextureAtlas:TextureAtlas = new TextureAtlas(texturecerebro, cerebroxml);
		
				
		private var cerebroframes2:Vector.<Texture> = cTextureAtlas.getTextures("explosion");
		
		private var explosion1:MovieClip;
		private var explosion2:MovieClip;
		private var explosion3:MovieClip;
		private var explosion4:MovieClip;
		private var explosion5:MovieClip;
		
		[Embed(source="../media/laser.xml", mimeType="application/octet-stream")]		
		public static const LaserXML:Class;
		
		[Embed(source = "../media/laser.png")]
		private static const Laser:Class;	
		
		private var bitmaplaser:Bitmap = new Laser();
		
		private var texturelaser:Texture = Texture.fromBitmap(bitmaplaser);
		
		private var laserxml:XML = XML(new LaserXML());
		
		private var lTextureAtlas:TextureAtlas = new TextureAtlas(texturelaser, laserxml);
		private var laserframes1:Vector.<Texture> = lTextureAtlas.getTextures("laser1.");
		private var laserframes2:Vector.<Texture> = lTextureAtlas.getTextures("laser2.");
		private var laserframes3:Vector.<Texture> = lTextureAtlas.getTextures("laser3.");
		private var laserframes4:Vector.<Texture> = lTextureAtlas.getTextures("laser4.");
		
		
		
		private var laser1:MovieClip;
		private var laser2:MovieClip;
		private var laser3:MovieClip;
		private var laser4:MovieClip;
		
		
		[Embed(source="../media/bola.png")]//Bloque del suelo
		public static const Bola:Class;
		
		
		
		private var bitmapbola:Bitmap = new Bola();
		private var texturebola:Texture = Texture.fromBitmap(new Bola());
		
		private var bola1:Image = new Image(texturebola);	
		private var bola2:Image = new Image(texturebola);
		private var bola3:Image = new Image(texturebola);	
		private var bola4:Image = new Image(texturebola);	
		
		
		
		[Embed(source="../media/fondog3.png")]//Bloque del suelo
		public static const Fondo:Class;
		
		
		
		private var bitmap9:Bitmap = new Fondo();
		private var texture9:Texture = Texture.fromBitmap(new Fondo());
		
		private var fondo:Image = new Image(texture9);	
		
		//venas
		
		[Embed(source="../media/vena.png")]
		public static const Vena1:Class;
		
		private var venabit:Bitmap = new Vena1();
		private var venatext:Texture = Texture.fromBitmap(new Vena1());
		
		private var vena1:Image = new Image(venatext);	
		private var vena2:Image = new Image(venatext);	
		private var vena3:Image = new Image(venatext);	
		private var vena4:Image = new Image(venatext);	
		
		//codigo ojo
		
		[Embed(source = "../media/ojojefe.png")]
		public static const Ojo:Class;
		
		private var ojobit:Bitmap = new Ojo();
		private var ojotex:Texture = Texture.fromBitmap(new Ojo());
		
		private var ojo:Image = new Image(ojotex);	
		
		//pupila
		
		[Embed(source="../media/pupila.png")]//Bloque del suelo
		public static const Pupila:Class;
		
		private var pupilabit:Bitmap = new Pupila();
		private var pupilatex:Texture = Texture.fromBitmap(new Pupila());
		
		private var pupila:Image = new Image(pupilatex);	
		
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
		
		[Embed(source = "../audio/boss.mp3")]
		public var MySound : Class;    
		public var sound : Sound;
		private var soundchanel:SoundChannel;
		
		
		
		//codigo bandera
		
		[Embed(source="../media/kawaiijena.png")]
		public static const bandera:Class;
		
		private var bitmap5:Bitmap = new bandera();
		private var texture5:Texture = Texture.fromBitmap(new bandera);
		
		private var bandera0:Image = new Image(texture5);	
		
		
	
		//ultimos bloques
		
		[Embed(source="../media/bloquefinal.png")]
		public static const Block3:Class;
		
		private var bitmap3:Bitmap = new Block3();
		private var texture3:Texture = Texture.fromBitmap(new Block3());
		
		private var block2:Image = new Image(texture3);	
		private var block3:Image = new Image(texture3);	
		private var block4:Image = new Image(texture3);	
		private var block5:Image = new Image(texture3);	
		private var block6:Image = new Image(texture3);
		
		private var block7:Image = new Image(texture3);		
		private var block8:Image = new Image(texture3);	
		
		private var block9:Image = new Image(texture3);		
		
		//Mas bloqueees!!
		
		[Embed(source="../media/bloque1.png")]
		public static const Block2:Class;
		
		private var bitmap1:Bitmap = new Block2();
		private var texture1:Texture = Texture.fromBitmap(new Block2());
		
		private var block1:Image = new Image(texture1);	
	
		public function Nivel3() 
		{
	
			super();	
			
			temporizador = new Timer(1000, 6);
		

			sound = (new MySound) as Sound;         
			soundchanel = sound.play(0,999);
			
			fondo.x = 0;
			fondo.y = -25;
			addChild(fondo);
			
			
			vena1.x = 675;
			vena1.y = 180;
			addChild(vena1);
			
			vena2.x = 700;
			vena2.y = 380;
			vena2.rotation = 0.184532925
			addChild(vena2);
						
			vena3.x = 0;
			vena3.y = 250;
			addChild(vena3);
			
			vena4.x = 0;
			vena4.y = 450;
			addChild(vena4);
			
			ojo.x = 200;
			ojo.y = 90;
			addChild(ojo);
			
			pupila.x = 370;
			pupila.y = 350;
			addChild(pupila);
			
			bandera0.x = 500;
			bandera0.y = -100;
			addChild(bandera0);
			
			block1.x = 150;
			block1.y = 770;
			addChild(block1);
			
			block2.x = -150;
			block2.y = 400;
			addChild(block2);	
			
			block3.x = 960;
			block3.y = 500;
			addChild(block3);	
						
			block4.x = 750;
			block4.y = 330;
			addChild(block4);	
			
			block5.x = 880;
			block5.y = 600;
			addChild(block5);	
			
			block6.x = -100;
			block6.y = 500;
			addChild(block6);	
			
			block7.x = -100;
			block7.y = 770;
			addChild(block7);	
			
			block8.x = 970;
			block8.y = 770;
			addChild(block8);
			
			block9.x = 65;
			block9.y = 650;
			addChild(block9);	
			
			
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
						
			bola1.x = 370;
			bola1.y = 350;
		
			bola2.x = 370;
			bola2.y = 350;
			
			laser1 = new MovieClip(laserframes1,6);
			laser1.x = 400;
			laser1.y = 450;	
			
			laser2 = new MovieClip(laserframes2,6);
			laser2.x = 500;
			laser2.y = 400;	
			
			laser3 = new MovieClip(laserframes3,6);
			laser3.x = 400;
			laser3.y = -200;	
			
			laser4 = new MovieClip(laserframes4,6);
			laser4.x = -200;
			laser4.y = 400;	
		
			explosion1 = new MovieClip(cerebroframes2, 6);
			explosion1.loop = false;
			
			explosion2 = new MovieClip(cerebroframes2, 6);
			explosion2.loop = false;
				
			explosion3 = new MovieClip(cerebroframes2, 6);
			explosion3.loop = false;
			
			explosion4 = new MovieClip(cerebroframes2, 6);
			explosion4.loop = false;
			
			explosion5 = new MovieClip(cerebroframes2, 6);
			explosion5.loop = false;
			
			
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
			trace(temporizador.currentCount);
			check_object(image, block9, 7);
			check_object(image, block6, 6);
			check_object(image, block5, 5);
			check_object(image, block4, 4);
			check_object(image, block3, 8);
			check_object(image, block2, 9);
			
			check_object(image, block7, 3);
			check_object(image, block8, 2);
			
			check_object2(image, block1, 1);
			if (espadaactiva==true) { enemigo (espada, vena1, explosion1, venam1); }
			if (espadaactiva==true) { enemigo (espada, vena2, explosion2, venam2); }
			if (espadaactiva==true) { enemigo (espada, vena3, explosion3, venam3); }
			if (espadaactiva==true) { enemigo (espada, vena4, explosion4, venam4); }
			
			
			if (laseractivo==true) {
				mueres(image, laser1);	
				mueres(image, laser2);
				mueres(image, laser3);
				mueres(image, laser4);
				
			}
			
			
			
			
			
			victoria (corriendo, bandera0);			
			victoria (image, bandera0);
			
			var currentDate:Date = new Date();
			
			pupila.x = 370 + (Math.cos(currentDate.getTime() * 0.001) * 15);
			pupila.y = 350 + (Math.cos(currentDate.getTime() * 0.002) * 15);
			
			ojo.x = 200 + (Math.cos(currentDate.getTime() * 0.001) * 5);
			ojo.y = 90 + (Math.cos(currentDate.getTime() * 0.002) * 5);
			
			
			if (aDown) {		
				
				image.x -= 6;
				corriendo.x = image.x + image.width;
			}	
			
			if (dDown) {
				
				corriendo.x = image.x;
				image.x += 6;
				}			
			
			if (temporizador.currentCount == 6){
				removeChild(laser1);
				Starling.juggler.remove(laser1);
				removeChild(laser2);
				Starling.juggler.remove(laser2);
				removeChild(laser3);
				Starling.juggler.remove(laser3);
				removeChild(laser4);
				Starling.juggler.remove(laser4);
				laseractivo = false;
				temporizador.stop();
				temporizador.reset();
				
				
				}
			
			
			if (temporizador.currentCount == 3) {
				
				
				bola1.x = 500;
				bola1.y = 400;
				
				bola2.x = 500;
				bola2.y = 400;
			
				bola3.x = 500;
				bola3.y = 400;
				
				bola4.x = 500;
				bola4.y = 400;
				
				
				
				addChild(bola1);
				addChild(bola2);
				addChild(bola3);
				addChild(bola4);
				bolaactiva = true;
				
				
			}
			if (bolaactiva == true) {
				bolamovimiento(bola1);
				bolamovimiento2(bola2);	
				bolamovimiento3(bola3);
				bolamovimiento4(bola4);	
				
				mueresbola(image, bola1);	
				mueresbola(image, bola2);
				mueresbola(image, bola3);	
				mueresbola(image, bola4);
			
			}
				
			if (contadorvenas == 4){
				
				removeChild(ojo);
				removeChild(pupila);
				
				
				explosion5.x = pupila.x;
				explosion5.y = pupila.y;
				if (bandera0.y < 720){
					
					bandera0.y += 4;
				}
				
			}
			
				
			adjust();				
	
					
		}
		
		public function bolamovimiento(bola:Image):void {
			var random1:int = (6.28318531 - (Math.floor(Math.random() * 0)));
			var random2:int = (5 - (Math.floor(Math.random() * 1)));
			bola.rotation += random1;
			bola.y += random2;
			bola.x += random2;
		}
		
		public function bolamovimiento2(bola:Image):void {
			var random1:int = (6.28318531 - (Math.floor(Math.random() * 0)));
			var random2:int = (5 - (Math.floor(Math.random() * 1)));
			bola.rotation += random1;
			bola.y += random2;
			bola.x -= random2;
		}
		
		public function bolamovimiento3(bola:Image):void {
			var random1:int = (6.28318531 - (Math.floor(Math.random() * 0)));
			var random2:int = (5 - (Math.floor(Math.random() * 1)));
			bola.rotation += random1;
			bola.y -= random2;
			bola.x -= random2;
		}
		
		public function bolamovimiento4(bola:Image):void {
			var random1:int = (6.28318531 - (Math.floor(Math.random() * 0)));
			var random2:int = (5 - (Math.floor(Math.random() * 1)));
			bola.rotation += random1;
			bola.y -= random2;
			bola.x += random2;
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
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,3, {id: "muerte"}, true));
				 
			 }
			
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
		
		
		public function mueres(Personaje:MovieClip , enemigo:MovieClip):void 
		{
		 if ((Personaje.bounds.intersects(enemigo.bounds) == true)) {	
				
				soundchanel.stop();
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,3, {id: "muerte"}, true));
				 
			 }
		}
		
		public function mueresbola(Personaje:MovieClip , enemigo:Image):void 
		{
		 if ((Personaje.bounds.intersects(enemigo.bounds) == true)) {	
				
				soundchanel.stop();
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,3, {id: "muerte"}, true));
				 
			 }
		}
		
		public function enemigo(Personaje:MovieClip , vena:Image, explosion:MovieClip, venaM:Boolean ):Boolean
		{
			if ((Personaje.bounds.intersects(vena.bounds) == true  ) && venaM== false) {
					 
				 
				contadorvenas+=1;
				removeChild(vena);
				
				venaM = true;
				explosion.x = vena.x;
				explosion.y = vena.y;
				
				
		
				addChild(explosion);				
				Starling.juggler.add(explosion);
				vena.x = -800;
				if (contadorvenas<4){
				
				
				laseractivo = true;
				explosion.play();
				temporizador.start();
				addChild(laser1);
				addChild(laser2);
				addChild(laser3);
				addChild(laser4);
				Starling.juggler.add(laser1);
				Starling.juggler.add(laser2);
				Starling.juggler.add(laser3);
				Starling.juggler.add(laser4);
				}
				
				
				return true;
			 }
				else return false;
		}
		
		
		public function victoria(Personaje:MovieClip , bandera:Image):void 
		{
			 if (Personaje.bounds.intersects(bandera.bounds) == true) {				 
				
				soundchanel.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, 0,{id: "victoria"}, true));
			 }
		
		}
		
	}

	

}
		