package share;


#if android
import openfl.utils.JNI;
#elseif cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end



class Share {
	
	public static function shareText(message:String):Void
	{
		#if mobile
		hxshare_share_text(message);
		#end
	}
	
	#if mobile
		#if android
		private static var hxshare_share_text = JNI.createStaticMethod ("org.haxe.extension.Share", "shareText", "(Ljava/lang/String;)V");
		#else
		private static var hxshare_share_text = Lib.load ("share", "share_share_text", 1);
		#end
	#end
	
}