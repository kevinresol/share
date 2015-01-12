#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace share;


static value share_share_text (value message) {
	shareText(val_string(message));
	return alloc_null();
}
DEFINE_PRIM (share_share_text, 1);


extern "C" void share_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (share_main);



extern "C" int share_register_prims () { return 0; }