package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="../src/media/graphics/fondo.png")]
		public static const BgWelcome:Class;
		
		[Embed(source="../src/media/graphics/welcome_playButton.png")]
		public static const WelcomePlayBtn:Class;
		
		[Embed(source="../src/media/muerto.jpg")]
		public static const muerto:Class;
		
		[Embed(source="../src/media/pantcontrol.jpg")]
		public static const ptctrl:Class;
		
		[Embed(source="../src/media/controles.png")]
		public static const controls:Class;
		
		[Embed(source="../src/media/reset.png")]
		public static const reset:Class;
		
		[Embed(source="../src/media/botonyw.png")]
		public static const botonyw:Class;
		
		[Embed(source="../src/media/TryAgain.png")]
		public static const tryagain:Class;
		
		[Embed(source="../src/media/hasganado.jpg")]
		public static const hasganado:Class;
		
		[Embed(source="../src/media/boton1.png")]
		public static const boton1:Class;
		
		[Embed(source="../src/media/boton2.png")]
		public static const boton2:Class;
		
		[Embed(source="../src/media/boton3.png")]
		public static const boton3:Class;
		

		private static var gameTextures:Dictionary = new Dictionary();

		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap3:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap3);
			}
			return gameTextures[name];
		}
	
	
	}
}