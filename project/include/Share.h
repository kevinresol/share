#ifndef HXSHARE_H
#define HXSHARE_H


namespace share {
	
	void init(AutoGCRoot * urlUpdated);
	void shareText(const char * message);
	const char * getURL();
	void dispatchURL(const char * url);
}


#endif