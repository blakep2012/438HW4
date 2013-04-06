CC = g++
CF = gcc
CFLAGS = -g -DRPC_SVC_FG

all: server worker request

server: server.o rpcCracker_svc.o
	$(CC) $(CFLAGS) -o server server.o -lnsl

worker: worker.o rpcCracker_clnt.o
	$(CC) $(CFLAGS) -o worker worker.o rpcCracker_clnt.o -lnsl

request: request.o rpcCracker_clnt.o
	$(CC) $(CFLAGS) -o request request.o rpcCracker_clnt.o -lnsl

rpcCracker_svc.o: rpcCracker.h
	$(CF) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CF) $(CFLAGS) -c rpcCracker_clnt.c

server.o:  server.cpp rpcCracker.h
	$(CC) $(CFLAGS) -c server.cpp 

worker.o: worker.cpp rpcCracker.h
	$(CC) -$(CFLAGS) -c worker.cpp

request.o: request.cpp rpcCracker.h
	$(CC) $(CFLAGS) -c request.cpp

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x

clean:
	rm -f rpcClient.cpp rpcClient.o rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h server.o
