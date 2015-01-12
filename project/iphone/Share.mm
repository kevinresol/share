#import <UIKit/UIKit.h>
#include <hx/CFFI.h>
#include <Share.h>


@interface NMEAppDelegate:NSObject <UIApplicationDelegate>
@end

@implementation NMEAppDelegate(TestGoogle)
- (BOOL) application:(UIApplication *) application
openURL:(NSURL *)url
sourceApplication: (NSString *) sourceApplication
annotation: (id)annotation
{
	NSLog(@"openURL");
	NSLog([url absoluteString]);
	share::dispatchURL([url absoluteString].UTF8String);
	return YES;
}
@end

namespace share {
	static AutoGCRoot * mUrlUpdated;
	static NSString * url;

	void init(AutoGCRoot * urlUpdated) {
		NSLog(@"objc init");
		mUrlUpdated = urlUpdated;
	}

	void shareText(const char * message) {
		NSString * msgString = [[NSString alloc] initWithUTF8String:message];
		[UIPasteboard generalPasteboard].string = msgString;
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
		    @"Copied to clipboard" message:msgString delegate:nil 
		    cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
	}

	const char * getURL() {
		if(url == nil)
			return "";
		else
			return url.UTF8String;
	}

	void dispatchURL(const char * url) {
		val_call1(mUrlUpdated->get(), alloc_string(url));
	}
}