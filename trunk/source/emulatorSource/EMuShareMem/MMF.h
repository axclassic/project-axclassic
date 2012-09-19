#ifndef MMF_H
#define MMF_H
#include "../common/types.h"
#ifdef WIN32
	#include <windows.h>
#else
	//#include "MMFMutex.h"
	class MMFMutex;
#endif

class MMF {
public:
	struct MMF_Struct {
		bool	Loaded;
		int32	datasize;
		int8	data[0];
	};

	MMF();
	virtual ~MMF();

			bool	Open(const char* iName, int32 iSize);
			void	Close();
	const	void*	GetHandle() { if (IsLoaded()) { return SharedMemory->data; } return 0; }
			void*	GetWriteableHandle() { if (!IsLoaded() && CanWrite()) { return SharedMemory->data; } return 0; }

	inline	bool	IsOpen()		{ return (bool) (SharedMemory != 0); }
	inline	bool	IsLoaded()		{ if (SharedMemory) { return SharedMemory->Loaded; } return false; }
			bool	SetLoaded()		{ if (SharedMemory && CanWrite()) { SharedMemory->Loaded = true; return true; } return false; }
	inline	bool	CanWrite()		{ if (SharedMemory) { return pCanWrite; } return false; }
	
#ifndef WIN32
	bool	m_alloc;
#endif
private:
	bool		pCanWrite;
	MMF_Struct* SharedMemory;
#ifdef WIN32
	HANDLE		hMapObject;
	LPVOID		lpvMem;
#else
	void*		lpvMem;
	MMFMutex*	pMMFMutex;
#endif
};
#endif
