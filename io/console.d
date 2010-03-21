module io.console;

import scaffold.console;

import synch.mutex;

import core.string;
import core.tostring;
import core.unicode;
import core.definitions;
import core.variant;

// Section: Enums

// Description: This enum gives possible events that can be triggered by the Console.
enum ConsoleEvent : uint {
	// Description: Fired when Ctrl+C is signaled.
	CtrlC,

	// Description: Fired when Ctrl+Break is signaled.
	CtrlBreak,
}

// Description: This enum gives all possible foreground colors for the console.
enum fgColor : uint {
	// Description: The color black.
	Black=0,

	// Description: The color red.
	Red,

	// Description: The color green.
	Green,

	// Description: The color yellow.
	Yellow,

	// Description: The color blue.
	Blue,

	// Description: The color magenta.
	Magenta,

	// Description: The color cyan.
	Cyan,

	// Description: The color white.
	White,

	// Description: The color black (emphasized).
	BrightBlack,

	// Description: The color red (emphasized).
	BrightRed,

	// Description: The color green (emphasized).
	BrightGreen,

	// Description: The color yellow (emphasized).
	BrightYellow,

	// Description: The color blue (emphasized).
	BrightBlue,

	// Description: The color magenta (emphasized).
	BrightMagenta,

	// Description: The color cyan (emphasized).
	BrightCyan,

	// Description: The color white (emphasized).
	BrightWhite,
}

// Description: This enum gives all possible background colors for the console.
enum bgColor : uint {
	// Description: The color black.
	Black=0,

	// Description: The color red.
	Red,

	// Description: The color green.
	Green,

	// Description: The color yellow.
	Yellow,

	// Description: The color blue.
	Blue,

	// Description: The color magenta.
	Magenta,

	// Description: The color cyan.
	Cyan,

	// Description: The color white.
	White,
}

// Section: Core

// Description: This class abstracts simple console operations.
class Console {
static:

	//Description: Sets the foreground color for the console.
	//fgclr: The foreground color to set.
	void setColor(fgColor fclr);

	//Description: Sets the foreground and background colors for the console.
	//fgclr: The foreground color to set.
	//bgclr: The background color to set.
	void setColor(fgColor fclr, bgColor bclr);

	//Description: Sets the background color for the console.
	//bgclr: The background color to set.
	void setColor(bgColor bclr);

	// Description: Clears the console screen.
	void clear();

	void position(Coord coord);

	void position(uint[] coord);

	void position(uint x, uint y);

	Coord position();

	// Description: Moves the position of the caret relative to its current location.
	// x: The number of columns for the caret to move.  Negative values move down.
	// y: The number of rows for the caret.  Negative values move up.
	void setRelative(int x, int y);

	// Description: Will show the caret.
	void showCaret();

	// Description: Will hide the caret.
	void hideCaret();

	bool caretVisible();

	// Description: Will return the height
	uint height();

	// Description: Will return the width
	uint width();

	// Description: Will wait for input and return the key pressed and also the translated Unicode UTF-32 character that this keypress represents, if applicable.
	// chr: Will be set to the UTF-32 character.
	// code: Will be set to the character code for the key pressed.
	void getChar(out dchar chr, out uint code);

	// Description: This function will save the current clipping context.
	void clipSave();

	// Description: This function will restore a former clipping context.
	void clipRestore();

	// Description: This function will clear the clipping context.
	void clipClear();

	// Description: This function will add a rectangular region defined as screen coordinates that will clip the drawing surface. When a clipping context is not clear, only regions within rectangles will be drawn to the screen.
	// region: The rectangular region to add as a clipping region.
	void clipRect(Rect region);

	// Description: This function will add a rectangular region defined as screen coordinates that will clip the drawing surface. When a clipping context is not clear, only regions within rectangles will be drawn to the screen.
	// left: The left coordinate of the rectangle.
	// top: The top coordinate of the rectangle.
	// right: The right coordinate of the rectangle.
	// bottom: The bottom coordinate of the rectangle.
	void clipRect(uint left, uint top, uint right, uint bottom);

	void putln(...);

	void put(...);

	void putv(Variadic vars);

	void putlnv(Variadic vars);

	void putStringAt(uint x, uint y, String str);

	void putString(String str);

	void putAt(uint x, uint y, ...);

	void putAtv(uint x, uint y, Variadic vars);

	// Description: Will print out this character to the screen and the current location.
	// chr: The UTF-32 character to print.
	void putChar(dchar chr);

	void lock();

	void unlock();
}

alias Console.put put;
alias Console.putln putln;