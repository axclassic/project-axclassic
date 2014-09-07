#ifndef _EQSTREAMFACTORY_H

#define _EQSTREAMFACTORY_H

#include <queue>
#include <map>
#include "../common/EQStream.h"
#include "../common/Condition.h"
#include "../common/timeoutmgr.h"
#include "../common/opcodemgr.h"
#include "../common/timer.h"

#if !defined(MAIL) && !defined(CHAT) && !defined(UCS)
#define STREAM_TIMEOUT 45000 //in ms
#else
#define STREAM_TIMEOUT 135000
#endif

class EQStreamFactory : private Timeoutable {
	private:
		int sock;
		int Port;

		bool ReaderRunning;
		Mutex MReaderRunning;
		bool WriterRunning;
		Mutex MWriterRunning;

		Condition WriterWork;

		EQStreamType StreamType;
		
		queue<EQStream *> NewStreams;
		Mutex MNewStreams;

		map<string,EQStream *> Streams;
		Mutex MStreams;

		virtual void CheckTimeout();

		Timer *DecayTimer;

	public:
		EQStreamFactory(EQStreamType type) : Timeoutable(5000) { ReaderRunning=false; WriterRunning=false; StreamType=type; sock=-1; }
		EQStreamFactory(EQStreamType type, int port);

		EQStream *Pop();
		void Push(EQStream *s);

		bool Open();
		bool Open(unsigned long port) { Port=port; return Open(); }
		bool IsOpen() { return sock!=-1; }
		void Close();
		void ReaderLoop();
		void WriterLoop();
		void Stop() { StopReader(); StopWriter(); }
		void StopReader() { MReaderRunning.lock(); ReaderRunning=false; MReaderRunning.unlock(); }
		void StopWriter() { MWriterRunning.lock(); WriterRunning=false; MWriterRunning.unlock(); WriterWork.Signal(); }
		void SignalWriter() { WriterWork.Signal(); }
};

#endif
