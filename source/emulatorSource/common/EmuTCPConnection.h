#ifndef EmuTCPCONNECTION_H_
#define EmuTCPCONNECTION_H_

#include "TCPConnection.h"
#include "timer.h"

#ifdef WIN32
  #pragma warning( disable : 4200 )
#endif
//moved out of TCPConnection:: to be more exportable
#pragma pack(1)
	struct EmuTCPNetPacket_Struct {
		int32	size;
		struct {
			int8
				compressed : 1,
				destination : 1,
				flag3 : 1,
				flag4 : 1,
				flag5 : 1,
				flag6 : 1,
				flag7 : 1,
				flag8 : 1;
		} flags;
		int16	opcode;
		uchar	buffer[0];
	};
#pragma pack()

struct SPackSendQueue;
class EmuTCPServer;

class EmuTCPConnection : public TCPConnection {
public:
	enum eTCPMode { modeConsole, modeTransition, modePacket };
	enum ePacketMode { packetModeZone, packetModeLauncher, packetModeLogin };
	
	EmuTCPConnection(int32 ID, EmuTCPServer* iServer, SOCKET iSock, int32 irIP, int16 irPort, bool iOldFormat = false);
	EmuTCPConnection(bool iOldFormat = false, EmuTCPServer* iRelayServer = 0, eTCPMode iMode = modePacket);	// for outgoing connections
	EmuTCPConnection(int32 ID, EmuTCPServer* iServer, EmuTCPConnection* iRelayLink, int32 iRemoteID, int32 irIP, int16 irPort);				// for relay connections
	virtual ~EmuTCPConnection();
	
	virtual bool	ConnectIP(int32 irIP, int16 irPort, char* errbuf = 0);
	virtual void	Disconnect(bool iSendRelayDisconnect = true);
	
	static EmuTCPNetPacket_Struct* MakePacket(ServerPacket* pack, int32 iDestination = 0);
	static SPackSendQueue* MakeOldPacket(ServerPacket* pack);
	
	virtual bool	SendPacket(ServerPacket* pack, int32 iDestination = 0);
	virtual bool	SendPacket(EmuTCPNetPacket_Struct* tnps);
	ServerPacket*	PopPacket(); // OutQueuePop()
	void SetPacketMode(ePacketMode mode) { PacketMode = mode; }
	
	eTCPMode		GetMode()	const		{ return TCPMode; }
	ePacketMode		GetPacketMode() const 	{ return(PacketMode); }
	
	//relay crap:
	inline bool		IsRelayServer() const { return RelayServer; }
	inline TCPConnection* GetRelayLink() const	{ return RelayLink; }
	inline int32	GetRemoteID() const	{ return RemoteID; }
	
protected:
	void	OutQueuePush(ServerPacket* pack);
	void	RemoveRelay(EmuTCPConnection* relay, bool iSendRelayDisconnect);
	
	void	SendNetErrorPacket(const char* reason = 0);
	
	virtual bool SendData(bool &sent_something, char* errbuf = 0);
	virtual bool RecvData(char* errbuf = 0);
	
	virtual bool ProcessReceivedData(char* errbuf = 0);
	bool ProcessReceivedDataAsPackets(char* errbuf = 0);
	bool ProcessReceivedDataAsOldPackets(char* errbuf = 0);
	void ProcessNetworkLayerPacket(ServerPacket* pack);
	
	virtual bool LineOutQueuePush(char* line);
	virtual void ClearBuffers();
	
	EmuTCPServer*		Server;
	
	eTCPMode		TCPMode;
	ePacketMode		PacketMode;
	bool pOldFormat;
	
	Timer keepalive_timer;
	Timer timeout_timer;
	
	//relay crap:
	EmuTCPConnection*	RelayLink;
	sint32			RelayCount;
	bool	RelayServer;
	int32			RemoteID;
	
	//input queue...
	void	InModeQueuePush(EmuTCPNetPacket_Struct* tnps);
	MyQueue<EmuTCPNetPacket_Struct> InModeQueue;
	
	//output queue...
	MyQueue<ServerPacket> OutQueue;
	Mutex	MOutQueueLock;
};

#endif /*EmuTCPCONNECTION_H_*/



