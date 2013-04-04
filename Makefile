CC = g++
CFLAGS = -g -DRPC_SVC_FG

all: request server worker

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x
	#rpcgen -Sc rpcCracker.x -o rpcClient.cpp

rpcCracker_svc.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_clnt.c


rpcClient.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcClient.cpp

request: rpcCracker_clnt.o 
	$(CC) -o $@ $@.cpp rpcCracker_clnt.o

worker: rpcCracker_clnt.o 
	$(CC) -o $@ $@.cpp rpcCracker_clnt.o

server:  rpcCracker_svc.o  
	$(CC) -o server server.cpp  rpcCracker_svc.o 



clean:
	rm -f rpcClient.cpp rpcClient.o rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h
