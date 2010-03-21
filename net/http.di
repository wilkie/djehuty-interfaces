/*
 * http.di
 *
 * This file implements the HTTP standard.
 *
 */

module net.http;

import core.string;
import core.definitions;
import synch.thread;
import synch.semaphore;
import core.stream;
import core.unicode;

import io.socket;
import io.console;

class HTTPHeader {
protected:

	String _httpVersion;

}

class HTTPServer {
}

// Section: Sockpuppets

// Description: This class facilitates a client connection to a HTTP Server.
class HTTPClient {
	this();
	~this();

	bool connect(string hostname, ushort port = 80);

	void get(string path);

	void setDelegate(void delegate(Stream) callback);

	void close();
}
