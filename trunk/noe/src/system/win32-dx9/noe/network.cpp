/**
 * NOE Library - Prototype demo.
 * Copyright (C) 2005-2006 Guillaume Blanchard.  All rights reserved.
//-----------------------------------------------------------------------------
 * @brief          Rendering manager
 * @file           render.cpp
 * @package        noe
 * @date           2006/10/6
 * @version        0.1
 * @author         Guillaume Blanchard
 */

// noe
#include <noe/network.h>

namespace noe
{

/**
 * Library initialize 
 * @test Library initialize and connection test.
 */
Network::Network()
{
	WSADATA wsaData;

	// We begin by initializing Winsock version 2.0
	WSAStartup(MAKEWORD(2, 0), &wsaData);

	m_Socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	DBG_ASSERT(m_Socket != INVALID_SOCKET, "Socket error: %d", WSAGetLastError());

	SOCKADDR_IN addr;
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = INADDR_ANY;	// Since this socket is listening for connections, any local address will do
	addr.sin_port = htons(8888);		// Convert integer 8888 to network-byte order and insert into the port field
	i32 ret = bind(m_Socket, rcast<SOCKADDR*>(&addr), sizeof(SOCKADDR)); // Bind the socket to our local server address
	DBG_ASSERT(ret != SOCKET_ERROR, "Socket error: %d", WSAGetLastError());
}

/**
 * Library release
 * @test Library release.
 */
Network::~Network()
{
	closesocket(m_Socket);

	// Shutdown Winsock
	WSACleanup();
}

}; // namespace noe