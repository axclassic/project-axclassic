
#include "../debug.h"
#include "Live.h"
#include "../opcodemgr.h"
#include "../logsys.h"
#include "../EQStreamIdent.h"
#include "../crc32.h"

#include "../eq_packet_structs.h"
#include "../MiscFunctions.h"
#include "../Item.h"
#include "Live_structs.h"

namespace Live {

static const char *name = "Live";
static OpcodeManager *opcodes = NULL;
static Strategy struct_strategy;

//char *SerializeItem(ItemInst *inst, sint16 slot_id, uint32 *length, uint8 depth);
	
void Register(EQStreamIdentifier &into) {
	//create our opcode manager if we havent already
	if(opcodes == NULL) {
		//TODO: get this file name from the config file
		string opfile = "patch_";
		opfile += name;
		opfile += ".conf";
		//load up the opcode manager.
		//TODO: figure out how to support shared memory with multiple patches...
		opcodes = new RegularOpcodeManager();
		if(!opcodes->LoadOpcodes(opfile.c_str())) {
			_log(NET__OPCODES, "Error loading opcodes file %s. Not registering patch %s.", opfile.c_str(), name);
			return;
		}
	}
	
	//ok, now we have what we need to register.
	
	EQStream::Signature signature;
	string pname;
	
	//register our world signature.
	pname = string(name) + "_world";
	signature.ignore_eq_opcode = 0;
	signature.first_length = sizeof(structs::LoginInfo_Struct);
	signature.first_eq_opcode = opcodes->EmuToEQ(OP_SendLoginInfo);
	into.RegisterPatch(signature, pname.c_str(), &opcodes, &struct_strategy);
	
	//register our zone signature.
	pname = string(name) + "_zone";
	signature.ignore_eq_opcode = opcodes->EmuToEQ(OP_AckPacket);
	signature.first_length = sizeof(structs::ClientZoneEntry_Struct);
	signature.first_eq_opcode = opcodes->EmuToEQ(OP_ZoneEntry);
	into.RegisterPatch(signature, pname.c_str(), &opcodes, &struct_strategy);

	_log(NET__IDENTIFY, "Registered patch %s", name);
}

void Reload() {
	
	//we have a big problem to solve here when we switch back to shared memory
	//opcode managers because we need to change the manager pointer, which means
	//we need to go to every stream and replace it's manager.
	
	if(opcodes != NULL) {
		//TODO: get this file name from the config file
		string opfile = "patch_";
		opfile += name;
		opfile += ".conf";
		if(!opcodes->ReloadOpcodes(opfile.c_str())) {
			_log(NET__OPCODES, "Error reloading opcodes file %s for patch %s.", opfile.c_str(), name);
			return;
		}
		_log(NET__OPCODES, "Reloaded opcodes for patch %s", name);
	}
}



Strategy::Strategy()
: Titanium::Strategy()
{
	//all opcodes default to passthrough.
	#include "SSRegister.h"
	#include "Live_ops.h"
}

std::string Strategy::Describe() const {
	std::string r;
	r += "Patch ";
	r += name;
	return(r);
}


#include "SSDefine.h"

EAT_ENCODE(OP_ZoneServerReady)
EAT_ENCODE(OP_GuildMemberLevelUpdate)

ENCODE(OP_SendCharInfo) {
	ENCODE_LENGTH_EXACT(CharacterSelect_Struct);
	SETUP_DIRECT_ENCODE(CharacterSelect_Struct, structs::CharacterSelect_Struct);
	int r;
	for(r = 0; r < 10; r++) {
		OUT(zone[r]);
		OUT(eyecolor1[r]);
		OUT(eyecolor2[r]);
		OUT(hairstyle[r]);
		OUT(primary[r]);
		OUT(race[r]);
		OUT(class_[r]);
		OUT_str(name[r]);
		OUT(gender[r]);
		OUT(level[r]);
		OUT(secondary[r]);
		OUT(face[r]);
		OUT(beard[r]);
		int k;
		for(k = 0; k < 9; k++) {
			OUT(equip[r][k]);
			OUT(cs_colors[r][k].color);
		}
		OUT(haircolor[r]);
		OUT(gohome[r]);
		OUT(deity[r]);
		OUT(beardcolor[r]);
	}
	FINISH_ENCODE();
}

/*ENCODE(OP_ExpansionInfo) {
	ENCODE_LENGTH_EXACT(ExpansionInfo_Struct);
	SETUP_DIRECT_ENCODE(ExpansionInfo_Struct, structs::ExpansionInfo_Struct);
	OUT(Expansions);
	FINISH_ENCODE();
}*/



















} //end namespace Live






