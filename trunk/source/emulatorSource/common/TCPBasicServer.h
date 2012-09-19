#ifndef TCPBASICSERVER_H_
#define TCPBASICSERVER_H_

#include "TCPServer.h"
#include "TCPConnection.h"

class TCPBasicServer : public TCPServer<TCPConnection> {
public:
	inline TCPBasicServer(int16 iPort = 0) : TCPServer<TCPConnection>(iPort) { }
	inline virtual void CreateNewConnection(int32 ID, SOCKET in_socket, int32 irIP, int16 irPort) {
		TCPConnection *conn = new TCPConnection(ID, in_socket, irIP, irPort);
		AddConnection(conn);
	}
};

#endif /*TCPBASICSERVER_H_*/

