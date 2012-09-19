
#include "../debug.h"
#include "patches.h"

#include "Client62.h"
#include "Titanium.h"
#include "Anniversary.h"
#include "Live.h"
#include "SoF.h"
//Unquote SoD for activation (Doesn't work right yet)
//#include "SoD.h" 

void RegisterAllPatches(EQStreamIdentifier &into) {
	Client62::Register(into);
	Titanium::Register(into);
	//Anniversary::Register(into);
	//Live::Register(into);
	SoF::Register(into);
	//SoD::Register(into);
}

void ReloadAllPatches() {
	Client62::Reload();
	Titanium::Reload();
	//Anniversary::Reload();
	//Live::Reload();
	SoF::Reload();
	//SoD::Reload();
}



















