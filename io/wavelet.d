module io.wavelet;

import core.stream;
import core.string;
import core.definitions;
import core.time;

import io.audio;
import io.console;

import math.common;
import math.vector;

enum Interpolate {
	Zeroth,
	Linear,
}

// Section: Core/Streams

// Description: This class represents an audio buffer.  You can do simple transforms on the audio data using the provided methods.  It is essentially a Stream, and you can read and write to the buffer in the same fashion.
class Wavelet : Stream {
	// Constructors //

	// Description: Will create a small buffer.  This will presumedly be resized.
	this();

	// -- Methods -- //

	// Description: Will get the format of the audio information.
	// Returns: An AudioFormat struct containing useful information such as sample rate and average bytes per second.
	AudioFormat audioFormat();

	// Description: Will set the audio format of the buffer.  Audio Codecs will set this automatically, but if the buffer format is otherwise unknown, it can be set using this function.
	// audFormat: An AudioFormat struct describing the contents of the buffer.
	void setAudioFormat(AudioFormat audFormat);

	// -- Computations -- //

	void upSample(Interpolate interpType);

	void downSample(Interpolate interpType);

	void pitchBend();

	void pitchShift();

	// Description: This function will shorten the wavelet to a specified region.
	void crop(Time start);

	// Description: This function will shorten the wavelet to a specified region.
	void crop(Time start, Time len);

	// Description: This function will return the amount of time this block represents
	Time time();

	cdouble[] fourier(int samples = 512, uint skipSamples = 0);
}

//alias WaveletImpl!(StreamAccess.AllAccess) Wavelet;
