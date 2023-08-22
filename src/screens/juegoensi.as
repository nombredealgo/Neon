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
	
	public class juegoensi extends Sprite 
	{			
		
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
		
		[Embed(source="../media/fondog.png")]//Bloque del suelo
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
		
		[Embed(source = "../audio/blte-.mp3")]
		public var MySound : Class;    
		public var musica : Sound;
		private var soundchanel:SoundChannel;
		
		
		//codigo cerebros
		private var explosion1:MovieClip;	
		private var explosion3:MovieClip;
		
		private var cerebro1:MovieClip;
		private var cerebro2:MovieClip;
		private var cerebro3:MovieClip;
		private var cerebro4:MovieClip;
		
		private var sentidoc1:int = 0;
		private var sentidoc2:int = 1;
		private var sentidoc3:int = 0;
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
		
		private var moto:MovieClip;
		private var proyectil:MovieClip;
		
		[Embed(source="../media/moto.xml", mimeType="application/octet-stream")]		
		public static const MotoXML:Class;
		
		[Embed(source = "../media/moto.png")]
		private static const Moto:Class;	
		
		private var bitmapmoto:Bitmap = new Moto();
		
		private var texturemoto:Texture = Texture.fromBitmap(bitmapmoto);
		
		private var motoxml:XML = XML(new MotoXML());
		
		private var mTextureAtlas:TextureAtlas = new TextureAtlas(texturemoto, motoxml);
		
		private var motoframes:Vector.<Texture> = mTextureAtlas.getTextures("moto");		
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
 
		[Embed(source="../media/bloquillo.png")]//Bloque del suelo
		public static const Block:Class;
		
		private var bitmap2:Bitmap = new Block();
		private var texture2:Texture = Texture.fromBitmap(new Block());
		
		private var blockpeke1:Image = new Image(texture2);	
		private var blockpeke2:Image = new Image(texture2);	
		private var blockpeke3:Image = new Image(texture2);	
		
		//codigo de los bloques!!	
 
		[Embed(source="../media/plataforma.png")]//Bloque del suelo
		public static const Block4:Class;
		public var sentidop1:int = 0;
		
		
		private var bitmap4:Bitmap = new Block4();
		private var texture4:Texture = Texture.fromBitmap(new Block4());
		
		private var plataforma1:Image = new Image(texture4);	
		private var plataforma2:Image = new Image(texture4);
		private var plataforma3:Image = new Image(texture4);
		private var plataforma4:Image = new Image(texture4);
		
		//Mas bloqueees!!
		
		[Embed(source="../media/bloque1.png")]
		public static const Block2:Class;
		
		private var bitmap1:Bitmap = new Block2();
		private var texture1:Texture = Texture.fromBitmap(new Block2());
		
		private var block1:Image = new Image(texture1);		
		private var block2:Image = new Image(texture1);
		private var block3:Image = new Image(texture1);
		private var block4:Image = new Image(texture1);		
		private var block5:Image = new Image(texture1);
		private var block6:Image = new Image(texture1);
		
		//ultimos bloques
		
		[Embed(source="../media/bloquefinal.png")]
		public static const Block3:Class;
		
		private var bitmap3:Bitmap = new Block3();
		private var texture3:Texture = Texture.fromBitmap(new Block3());
		
		private var block7:Image = new Image(texture3);		
		private var block8:Image = new Image(texture3);		
		private var block9:Image = new Image(texture3);	
		
	
				
		public function juegoensi() 
		{
	
			super();	
			
			musica = (new MySound) as Sound;         
			soundchanel = musica.play(0,999);
			
		
			
				
			fondo.x = 0;
			fondo.y = -25;
			addChild(fondo);	
			
			block1.x = 0;
			block1.y = 550;
			addChild(block1);
			
			plataforma1.x = 835;
			plataforma1.y = 550;
			addChild(plataforma1);
			
			plataforma2.x = 800;
			plataforma2.y = 320;
			addChild(plataforma2);
			
			plataforma3.x = 580;
			plataforma3.y = 370;
			addChild(plataforma3);
			
			plataforma4.x = 300;
			plataforma4.y = 370;
			addChild(plataforma4);
		
			
			block3.x = -450;
			block3.y = 455;
			addChild(block3);
			
			block2.x = -500;
			block2.y = 410;
			addChild(block2);
			
			block4.x = -400;
			block4.y = 505;
			addChild(block4);
			
			block5.x = 0;
			block5.y =200;
			addChild(block5);
			
			block6.x = 560;
			block6.y =80;
			addChild(block6);
			
			blockpeke1.x = 300;
			blockpeke1.y = 770;
			addChild(blockpeke1);	
			
			blockpeke2.x = 500;
			blockpeke2.y = 770;
			addChild(blockpeke2);	
			
			blockpeke3.x = 700;
			blockpeke3.y = 770;
			addChild(blockpeke3);	
			
			block8.x =50;
			block8.y = 80;
			addChild(block8);
			
			block9.x =300;
			block9.y = 80;
			addChild(block9);
			
			block7.x = 0;
			block7.y = 770;
			addChild(block7);	
			
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
			cerebro1.x =600;
			cerebro1.y = 700;
			addChild(cerebro1);	
			Starling.juggler.add(cerebro1);
			
			cerebro2 = new MovieClip(cerebroframes,2);			
			cerebro2.x = 400;
			cerebro2.y = 700;
			addChild(cerebro2);	
			Starling.juggler.add(cerebro2);
			
			cerebro3 = new MovieClip(cerebroframes,2);			
			cerebro3.x =240;
			cerebro3.y = 0;
			addChild(cerebro3);	
			Starling.juggler.add(cerebro3);
			
			cerebro4 = new MovieClip(cerebroframes,2);			
			cerebro4.x =485;
			cerebro4.y = 0;
			addChild(cerebro4);	
			Starling.juggler.add(cerebro4);
			
			proyectil = new MovieClip(proyectilframes,6);			
			proyectil.x =750;
			proyectil.y = 0;
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
			
			
			
			moto = new MovieClip(motoframes, 12);
			moto.pivotX = moto.width / 2;
			moto.x =400;
			moto.y = 510;
			addChild(moto);	
			Starling.juggler.add(moto);
			
			dino1 = new MovieClip(dinoframes,4);			
			dino1.x = 750;
			dino1.y = 0;
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
		;
			if (e.keyCode == 32) {	
				espadaactiva = false;
				Starling.juggler.remove(espada);
				removeChild(espada);
				addChild(image);	
				Starling.juggler.add(image);
				
				 }
		
			if (e.keyCode == 65 && espadaactiva==false){
				aDown = false;				
				Starling.juggler.remove(corriendo);
				removeChild(corriendo);
				image.visible = true;
				addChild(image);	
				Starling.juggler.add(image);
				runing = false;
				 }
				
			if (e.keyCode == 68 && espadaactiva==false){
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
			if ((e.keyCode == 87) && (image.y + image.height >= floor) && (runing == false) && (espadaactiva==false)){ 
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
				if (e.keyCode == 65 && espadaactiva==false){
					
					
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
				if (e.keyCode == 68  && espadaactiva==false) {
					
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
					
					if (e.keyCode == 32 && runing == false) {
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
			check_object(image,blockpeke1, 10);
			check_object(image,blockpeke2, 11);
			check_object(image, blockpeke3, 12);
			
			
			check_object2(image, block1, 1);
			check_object2(image, block2, 2);
			check_object2(image, block3, 3);
			check_object2(image, block4, 4);
			check_object2(image, block5, 5);
			check_object2(image, block6, 6);
			check_object(image, block7, 7);
			check_object(image, block8, 8);
			check_object(image, block9, 9);
			
			check_object2(image, plataforma2, 13);
			check_object2(image, plataforma3, 14);
			check_object2(image, plataforma4, 15);
			
			plataformas(image, plataforma1);

			
			motomovimiento();
			
			if (enemigomuerto1 != true) {
				
				proyectilmovimiento();
				mueres(image, proyectil);	
			}
			else { proyectil.visible = false; }
			
			cerebro1movimiento();
			cerebro2movimiento();
			cerebro3movimiento();
			cerebro4movimiento();
			plataforma1movimiento();
			
			victoria (corriendo, bandera0);			
			victoria (image, bandera0);
			
			mueres(image, proyectil);	
			
			mueres(image, cerebro1);	
								
			mueres(image, cerebro2);
			
			mueres(image, cerebro3);
			
			mueres(image, cerebro4);
			
			
			if (enemigomuerto3 != true) {
				
				enemigo(espada, moto, explosion3);				
				mueres(image, moto);			
				
			}
						
			
			if (enemigo(espada, moto, explosion3) == true) {
				
				enemigomuerto3 = true;
			}
			
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
				proyectil.x =750;
				proyectil.y = 0;
			}
						
		}
		
		public function cerebro1movimiento():void {
			
			if (sentidoc1 == 1) {
				cerebro1.y -= 5;
				if (cerebro1.y < 600) {
					sentidoc1 = 0;
				}
			}
			else{
			if (sentidoc1 == 0) {
				cerebro1.y += 5;
				if (cerebro1.y > 800) {
					sentidoc1 = 1;
				}
			}
			}
		}
		public function cerebro3movimiento():void {
			
			if (sentidoc3 == 1) {
				cerebro3.y += 5;
				if (cerebro3.y > 150) {
					sentidoc3 = 0;
				}
			}
			else{
			if (sentidoc3 == 0) {
				cerebro3.y -= 5;
				if (cerebro3.y < -20) {
					sentidoc3 = 1;
				}
			}
			}
		}
		public function cerebro4movimiento():void {
			
			if (sentidoc4 == 1) {
				cerebro4.y += 5;
				if (cerebro4.y > 150) {
					sentidoc4 = 0;
				}
			}
			else{
			if (sentidoc4 == 0) {
				cerebro4.y -= 5;
				if (cerebro4.y < -20) {
					sentidoc4 = 1;
				}
			}
			}
		}
		
		public function cerebro2movimiento():void {
			
			if (sentidoc2 == 1) {
				cerebro2.y -= 5;
				if (cerebro2.y < 600) {
					sentidoc2 = 0;
				}
			}
			
			if (sentidoc2 == 0) {
				cerebro2.y += 5;
				if (cerebro2.y > 800) {
					sentidoc2 = 1;
				}
				
			}
		}
		
		public function plataforma1movimiento():void {
			
			if (sentidop1 == 1) {
				plataforma1.y -= 1;
				if (plataforma1.y < 550) {
					sentidop1 = 0;
				}
			}
			
			if (sentidop1 == 0) {
				plataforma1.y += 1;
				if (plataforma1.y > 760) {
					sentidop1 = 1;
				}
				
			}
		}
		
		
		
		public function motomovimiento():void {
			
			if (moto.scaleX == 1) {
				moto.x -= 8;
				if (moto.x < 350){
					moto.scaleX = -1;
				}
			}
			else { 
				moto.x += 8;
				if (moto.x > 680){
					moto.scaleX = 1;
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
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,1, {id: "muerte"}, true));
				 
			 }
			
		}
		
		public function plataformas(Personaje:MovieClip , Block:Image):void 
		{
			if  ((Personaje.bounds.intersects(Block.bounds) == true)) {
				
				floor = Block.y + 15;
			}			
			
			else{ if( onBlock == -1) {floor = 1000}}
			
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
				
				explosion.x = enemigo.x;
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
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,1, {id: "muerte"}, true));
				 
			 }
		}
		
		public function victoria(Personaje:MovieClip , bandera:Image):void 
		{
			 if (Personaje.bounds.intersects(bandera.bounds) == true) {				 
				
				soundchanel.stop();
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,0, {id: "nivel2"}, true));
			 }
		
		}
		
	}

	

}
		