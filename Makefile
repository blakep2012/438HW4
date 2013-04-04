CC = g++
CFLAGS = -g -DRPC_SVC_FG

all: request server worker

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x
	#rpcgen -Sc rpcCracker.x -o rpcClient.cpp
	

rpcCracker_xdr.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_xdr.c

rpcCracker_svc.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_clnt.c



rpcClient.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcClient.cpp

request: rpcCracker_clnt.o rpcCracker_xdr.o
	$(CC) -o $@ $@.cpp rpcCracker_clnt.o rpcCracker_xdr.o

worker: rpcCracker_clnt.o rpcCracker_xdr.o
	$(CC) -o $@ $@.cpp rpcCracker_clnt.o rpcCracker_xdr.o

server:  rpcCracker_svc.o  rpcCracker_xdr.o
	$(CC) -o server server.cpp  rpcCracker_svc.o rpcCracker_xdr.o



clean:
	rm -f rpcClient.cpp rpcClient.o rpcCracker_xdr.* rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h
