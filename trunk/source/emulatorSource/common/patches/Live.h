#ifndef Live_H_
#define Live_H_

#include "../StructStrategy.h"
#include "Titanium.h"

class EQStreamIdentifier;

namespace Live {
	
	//these are the only public member of this namespace.
	extern void Register(EQStreamIdentifier &into);
	extern void Reload();
	
	
	
	//you should not directly access anything below.. 
	//I just dont feel like making a seperate header for it.
	
	class Strategy : public Titanium::Strategy {
	public:
		Strategy();
		
	protected:
		
		virtual std::string Describe() const;
		
		//magic macro to declare our opcodes
		#include "SSDeclare.h"
		#include "Live_ops.h"
		
	};
	
};



#endif /*Live_H_*/
