CC = g++
CFLAGS = -g -DRPC_SVC_FG

rpcCracker_svc.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_clnt.c

rpcCracker_xdr.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_xdr.c

rpcServer.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcServer.cpp

rpcClient.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcClient.cpp

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x
	rpcgen -Sc rpcCracker.x -o rpcClient.cpp
	rpcgen -Ss rpcCracker.x -o rpcServer.cpp

clean:
	rm -f rpcClient.cpp rpcClient.o rpcServer.cpp rpcServer.o rpcCracker_xdr.* rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h
