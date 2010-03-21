/*
 * file.d
 *
 * This file contains the magic behind File.
 *
 */

module io.file;

import djehuty;

import io.directory;

// Section: Core/Streams

// Description: This class wraps common file operations within the context of a Stream.
class File : Stream {
	// Description: Will open the file located at the _path at filename.  The internal pointer will point to the beginning of the file.
	// filename: The file to open.
	this(string filename);

	// Description: Will create a closed File class.  You must open a file to use it as a stream.
	this();

	~this();

	// Description: Will open the file located at the _path at filename.  The internal pointer will point to the beginning of the file.
	// filename: The file to open.
	// Returns: Will return an instance to the opened file.
	static File open(String filename);

	static File open(string filename);

	static File create(String filename);

	static File create(string filename);

	// Methods //

	// Inherited Functionality

	alias Stream.write write;
	alias Stream.append append;
	alias Stream.read read;

	// Core Functionality

	// Description: Will close the file.  This is also done upon deconstruction of the class, for instance when it is garbage collected.
	void close();

	// read
	override bool read(void* buffer, uint len);

	override bool read(Stream stream, uint len);

	override ulong readAny(void* buffer, uint len);

	override ulong readAny(Stream stream, uint len);

	// Console.put

	override bool write(ubyte* bytes, uint len);

	override bool write(Stream stream, uint len);

	// append

	override bool append(ubyte* bytes, uint len);

	override bool append(Stream stream, uint len);

	override ulong remaining();

	// rewind

	override void rewind();

	override bool rewind(ulong amount);

	override ulong rewindAny(ulong amount);

	// skip

	override void skip();

	override bool skip(ulong amount);

	override ulong skipAny(ulong amount);

	// Description: Will return the String representing the filename currently open, or null for when there is no open file.
	// Returns: The string representing the filename of this class.
	String name();

	override bool duplicate(ulong distanceBehind, uint amount);

	override bool duplicateFromEnd(ulong distanceBehind, uint amount);

	// File logic

	Directory path();

	void move(Directory destination);

	void move(String destination);

	File copy(Directory destination);

	File copy(String destination);

	void destroy();

	override char[] toString();

	int opApply(int delegate(ref string) loopFunc);

	int opApply(int delegate(ref String) loopFunc);
}

// Section: Core/Streams

// Description: This class wraps common file operations within the context of a Stream. The permissions of this object will not allow writes.
class FileReader : File {
	// Description: Will open the file located at the _path at filename. The internal pointer will point to the beginning of the file.
	// filename: The file to open.
	this(string filename);

	// Description: Will create a closed File class. You must open a file to use it as a stream.
	this();
}

// Section: Core/Streams

// Description: This class wraps common file operations within the context of a Stream. The permissions of this object will not allow reads.
class FileWriter : File {
	// Description: Will open the file located at the _path at filename. The internal pointer will point to the beginning of the file.
	// filename: The file to open.
	this(string filename);

	// Description: Will create a closed File class. You must open a file to use it as a stream.
	this();
}
