#ifndef PETS_H
#define PETS_H

	#define PET_BACKOFF			1
	#define PET_GETLOST			2
	#define PET_HEALTHREPORT	4
	#define PET_GUARDHERE		5
	#define PET_GUARDME			6
	#define PET_ATTACK			7
	#define PET_FOLLOWME		8
	#define PET_SITDOWN			9
	#define PET_STANDUP			10
	#define PET_TAUNT			11
	#define PET_HOLD			12
	#define PET_NOTAUNT			14
	#define PET_LEADER			16
	#define	PET_SLUMBER			17	
	
	class Pet : public NPC {
	public:
		Pet(NPCType *type_data, Mob *owner, PetType type, int16 spell_id);
		
	};
/*
 * I dont have the patience to take on this project today....
class Pet : public NPC {
public:
	enum eStandingPetOrder { SPO_Follow, SPO_Sit, SPO_Guard };
	

	const int16	pet_spell_id;
	
	inline void	SetPetOrder(eStandingPetOrder i) { pStandingPetOrder = i; }
	inline eStandingPetOrder GetPetOrder() const { return pStandingPetOrder; }
//	void	SetPetType(int16 in_type)	{ typeofpet = in_type; } // put this here because only NPCs can be anything but charmed pets
	void	GetPetState(SpellBuff_Struct *buffs, int32 *items, char *name);
	void	SetPetState(SpellBuff_Struct *buffs, int32 *items);
protected:
//	int16			typeofpet; // 0xFF = charmed
	
	eStandingPetOrder pStandingPetOrder;
	bool	taunting;
    Timer	taunt_timer;		//for pet taunting
};*/

#endif














