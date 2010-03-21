/*
 * directory.d
 *
 * This file contains the logic for the Directory class, which allows
 * traversal of the filesystem.
 *
 */

module io.directory;

import djehuty;

import io.file;

// Section: Core

// Description: This class represents a file system directory.
class Directory {
	// Description: This constructor will create a Directory object that represents the root.
	this();

	// Description: This constructor will create a Directory object that represents the path, if valid.
	// path: A valid universal path.
	this(string path);

	bool isDir(String _name);

	bool isDir(string _name);

	void move(String path);

	void move(Directory to);

	void move(string path);

	void copy(String path);

	void copy(string path);

	void copy(Directory to, String newName = null);

	void copy(Directory to, string newName = null);

	// Description: This function will return a String representing the _name of the directory.
	// Returns: The _name of the directory.
	String name();

	// Description: This function will return a String representing the path of this directory.
	// Returns: The path of the directory.
	String path();

	// Description: This function will rename the directory, if possible.
	// newName: The new _name for the directory.
	void name(String newName);

	// Description: This function will rename the directory, if possible.
	// newName: The new _name for the directory.
	void name(string newName);

	// Description: This function will open the file specified by the parameter if it exists within the directory.
	// filename: The _name of the file to open.
	// Returns: Will return null if the file cannot be opened or found, will return a valid File otherwise.
	File openFile(String filename);

	// Description: This function will create a new file in this directory.
	// filename: The _name of the file to create.
	// Returns: Will return null if the file cannot be created, will return a valid File otherwise.
	File saveFile(String filename);

	File saveFile(string filename);

	// Description: This function will return the _parent directory of the current path.
	// Returns: The Directory object representing the _parent directory and null if the current directory is the root.
	Directory parent();

	// Description: This function will return the Directory representing the directory specified within the current path.
	// directoryName: The _name of the directory.
	// Returns: The child directory specified.
	Directory traverse(String directoryName);

	// Description: This function will return the Directory representing the directory specified within the current path.
	// directoryName: The _name of the directory.
	// Returns: The child directory specified.
	Directory traverse(string directoryName);

	// Description: This function will return whether or not the object represents the root.
	// Returns: Will return true when the Directory is root and false otherwise.
	bool isRoot();

	// Description: This function will return an array of filenames that are found within this directory.
	// Returns: An array of filenames.
	String[] list();

	bool opEquals(Directory d);

	bool opEquals(String d);

	bool opEquals(string d);

	// this should work:
	alias Object.opEquals opEquals;

	override string toString();
}
