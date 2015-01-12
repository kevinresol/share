package share;

import msignal.Signal.Signal1;

#if android
import openfl.utils.JNI;
#elseif cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end



class Share {
	
	public static var urlUpdated(default, null):Signal1<String>;
	
	private static var inited:Bool = false;
	
	public static function shareText(message:String):Void
	{
		#if mobile
		share_share_text(message);
		#end
	}
	
	public static function getURL():String
	{
		#if mobile
		return share_get_url();
		#end
	}
	
	public static function init():Bool
	{
		#if android
		urlUpdated = new Signal1();
		share_init(urlUpdated);
		return true;
		#elseif ios
		urlUpdated = new Signal1();
		share_init(urlUpdated.dispatch);
		#end
		
		return false;
	}
	
	#if mobile
		#if android
		private static var share_init = JNI.createStaticMethod ("org.haxe.extension.Share", "init", "(Lorg/haxe/lime/HaxeObject;)V");
		private static var share_share_text = JNI.createStaticMethod ("org.haxe.extension.Share", "shareText", "(Ljava/lang/String;)V");
		private static var share_get_url = JNI.createStaticMethod ("org.haxe.extension.Share", "getURL", "()Ljava/lang/String;");
		#else
		private static var share_share_text = Lib.load ("share", "share_share_text", 1);
		private static var share_init = Lib.load ("share", "share_init", 1);
		private static var share_get_url = Lib.load ("share", "share_get_url", 0);
		#end
	#end
	
}
