CC = g++
CFLAGS = -g -DRPC_SVC_FG

all: server worker request

server: server.o 
	$(CC) $(CFLAGS) -o server server.o rpc_xdr.o -lnsl

worker: worker.o
	$(CC) $(CFLAGS) -o worker worker.o rpcCracker_clnt.o -lnsl

request: request.o rpcCracker_clnt.o
	$(CC) $(CFLAGS) -o request request.o rpcCracker_clnt.o -lnsl

rpcCracker_svc.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_clnt.c

server.o:  rpcServer.cpp rpcCracker.h  
	$(CC) $(CFLAGS) -c rpcServer.cpp 

worker.o: worker.cpp rpcCracker.h
	$(CC) -$(CFLAGS) -c worker.cpp

request.o: requst.cpp rpcCracker.h
	$(CC) $(CFLAGS) -c request.cpp

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x


clean:
	rm -f rpcClient.cpp rpcClient.o rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h
