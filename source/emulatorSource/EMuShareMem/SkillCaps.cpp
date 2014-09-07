#include "../common/debug.h"

#ifdef WIN32
#include <windows.h>
#else
#include "../common/unix.h"
#endif

#include <memory.h>
#include <iostream>
using namespace std;
#include "SkillCaps.h"
#include "../common/timer.h"
#include "MMF.h"

MMF SkillCapsMMF;
const MMFSkillCaps_Struct* MMFSkillCapsData = 0;
MMFSkillCaps_Struct* MMFSkillCapsData_Writable = 0;


DLLFUNC uint16 GetSkillCap(int8 Class_, int8 Skill, int8 Level) {
	if (MMFSkillCapsData == 0 || (!SkillCapsMMF.IsLoaded()))
		return 0;
	if (Class_ >= MMFSkillCapsData->ClassCount || Skill >= MMFSkillCapsData->SkillCount || Level >= MMFSkillCapsData->LevelCount)
		return(0);

	uint32 index = 
		  (((Class_ * MMFSkillCapsData->SkillCount) + Skill) * MMFSkillCapsData->LevelCount)
		+ Level;
	
	return MMFSkillCapsData->caps[index];
}

DLLFUNC bool SetSkillCap(int8 Class_, int8 Skill, int8 Level, uint16 cap) {
    if (!MMFSkillCapsData_Writable)
		return false;
	if (Class_ >= MMFSkillCapsData_Writable->ClassCount || Skill >= MMFSkillCapsData_Writable->SkillCount || Level >= MMFSkillCapsData_Writable->LevelCount)
		return false;

	uint32 index = 
		  (((Class_ * MMFSkillCapsData_Writable->SkillCount) + Skill) * MMFSkillCapsData_Writable->LevelCount)
		+ Level;
    
	MMFSkillCapsData_Writable->caps[index] = cap;
	
	return true;
}

DLLFUNC uint8 GetTrainLevel(int8 Class_, int8 Skill, int8 Level){
	if (MMFSkillCapsData == 0 || (!SkillCapsMMF.IsLoaded()))
		return 0;
	if (Class_ >= MMFSkillCapsData->ClassCount || Skill >= MMFSkillCapsData->SkillCount || Level >= MMFSkillCapsData->LevelCount)
		return(0);

	uint32 index = (((Class_ * MMFSkillCapsData->SkillCount) + Skill) * MMFSkillCapsData->LevelCount);
	
	for(int x = 0; x < Level; x++){
		if(MMFSkillCapsData->caps[index + x]){
			return (x);
		}
	}
	return(0);
}

DLLFUNC void ClearSkillCaps() {
	if (!MMFSkillCapsData_Writable)
		return;
	
	memset(MMFSkillCapsData_Writable->caps, 0, 
		sizeof(uint16)*(MMFSkillCapsData->ClassCount*MMFSkillCapsData->SkillCount*MMFSkillCapsData->LevelCount));
	
}

DLLFUNC bool LoadSkillCaps(CALLBACK_DBLoadSkillCaps cb, int32 opsize, int8 ClassCount, int8 SkillCount, int8 LevelCount) {
	if(opsize != sizeof(uint16)) {
		cout << "Error: EMuShareMem: DLLLoadSkillCaps: opsize != sizeof(uint16)" << endl;
		cout << "SkillCap size has changed, EMuShareMem.dll needs to be recompiled." << endl;
		return false;
	}
	int32 tmpMemSize = sizeof(MMFSkillCaps_Struct) + opsize * (ClassCount*SkillCount*LevelCount);
	if (SkillCapsMMF.Open("EQEMuKSkillCaps", tmpMemSize)) {
		if (SkillCapsMMF.CanWrite()) {
			MMFSkillCapsData_Writable = (MMFSkillCaps_Struct*) SkillCapsMMF.GetWriteableHandle();
			if (!MMFSkillCapsData_Writable) {
				cout << "Error: EMuShareMem: DLLLoadSkillCaps: !MMFSkillCapsData_Writable" << endl;
				return false;
			}
			//we need to memset the eq SkillCaps
			memset(MMFSkillCapsData_Writable->caps, 0, sizeof(uint16)*(ClassCount*SkillCount*LevelCount));
			
			MMFSkillCapsData_Writable->ClassCount = ClassCount;
			MMFSkillCapsData_Writable->SkillCount = SkillCount;
			MMFSkillCapsData_Writable->LevelCount = LevelCount;
			// use a callback so the DB functions are done in the main exe
			// this way the DLL doesnt have to open a connection to mysql
			if (!cb()) {
				cout << "Error: EMuShareMem: DLLLoadSkillCaps: !cbDBLoadSkillCaps" << endl;
				return false;
			}
			
			MMFSkillCapsData_Writable = 0;
			
			SkillCapsMMF.SetLoaded();
			MMFSkillCapsData = (const MMFSkillCaps_Struct*) SkillCapsMMF.GetHandle();
			if (!MMFSkillCapsData) {
				cout << "Error: EMuShareMem: DLLLoadSkillCaps: !MMFSkillCapsData (CanWrite=true)" << endl;
				return false;
			}
			return true;
		} else {
			if (!SkillCapsMMF.IsLoaded()) {
				Timer::SetCurrentTime();
				int32 starttime = Timer::GetCurrentTime();
				while ((!SkillCapsMMF.IsLoaded()) && ((Timer::GetCurrentTime() - starttime) < 300000)) {
					Sleep(10);
					Timer::SetCurrentTime();
				}
				if (!SkillCapsMMF.IsLoaded()) {
					cout << "Error: EMuShareMem: DLLLoadSkillCaps: !SkillCapsMMF.IsLoaded() (timeout)" << endl;
					return false;
				}
			}
			MMFSkillCapsData = (const MMFSkillCaps_Struct*) SkillCapsMMF.GetHandle();
			if (!MMFSkillCapsData) {
				cout << "Error: EMuShareMem: DLLLoadSkillCaps: !MMFSkillCapsData (CanWrite=false)" << endl;
				return false;
			}
			
			return true;
		}
	}
	else {
		cout << "Error Loading SkillCaps: SkillCaps.cpp: pDLLLoadSkillCaps: ret == 0, size = " << tmpMemSize << endl;
		return false;
	}
	return false;
}





