module io.socket;

import djehuty;

// Section: Core/Streams

// Description: This class wraps networking calls and represents the information stream as a Stream class.  This is a low-level implementation of a socket.  Note: no rewind or seek operations will have any affect.
class Socket : Stream {
	~this();

	// Methods

	// Inherited Functionality

	alias Stream.write write;
	alias Stream.append append;
	alias Stream.read read;

	// Core Functionality

	// Description: Will open a connection with the host on the port given by the parameters.
	// hostname: The name of the host to connect.
	// port: The port to connect through.
	// Returns: Will return true when the connect is made and false if the connection cannot be made.
    bool connect(String hostname, ushort port);

	// Description: Will open a connection with the host on the port given by the parameters.
	// hostname: The name of the host to connect.
	// port: The port to connect through.
	// Returns: Will return true when the connect is made and false if the connection cannot be made.
    bool connect(string hostname, ushort port);

	// Description: Binds to a port, causes the socket to act as a server.
	// port: The port to listen for connection requests.
	// Returns: Will return false on failure.
    bool bind(ushort port);

	// Description: Will listen to a binded port.  Use bind() prior to this.  It will not return until a connection is requested from a client.
	// Returns: Will return false on failure.
    bool listen();

	// Description: Will accept a connection request from a client.  Do this after returning from a Listen() call without failure.
	// Returns: Will return false on failure.
    bool accept();

	// Description: Will close the connection, if open.  This is also done upon deconstruction of the class, for instance when it is garbage collected.
    void close();

    // read
	override bool read(void* buffer, uint len);

	override bool read(Stream stream, uint len);

	override ulong readAny(void* buffer, uint len);

	override ulong readAny(Stream stream, uint len);

    // write

	override bool write(ubyte* bytes, uint len);

	override bool write(Stream stream, uint len);

    // append

	override bool append(ubyte* bytes, uint len);

	override bool append(Stream stream, uint len);

	// rewind

	override void rewind();

	override bool rewind(ulong amount);

	override ulong rewindAny(ulong amount);

	// skip

	override void skip();

	override bool skip(ulong amount);

	override ulong skipAny(ulong amount);

	// Description: Will return the String representing the host currently open, or null for when there is no open socket.
	// Returns: The String of the host.
    String hostname();

	ulong port();
}

class SocketReader : Socket {
}

class SocketWriter : Socket {
}
