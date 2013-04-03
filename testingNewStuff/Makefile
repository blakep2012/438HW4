CC = g++
CFLAGS = -g -DRPC_SVC_FG

rpcCracker_svc.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_svc.c

rpcCracker_clnt.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_clnt.c

rpcCracker_xdr.o: rpcCracker.h
	$(CC) $(CFLAGS) -c rpcCracker_xdr.c

server.o: rpcCracker.h
	$(CC) $(CFLAGS) -c server.cpp

client.o: rpcCracker.h
	$(CC) $(CFLAGS) -c client.cpp

rpcCracker.h: rpcCracker.x
	rpcgen -C rpcCracker.x
	rpcgen -Sc rpcCracker.x -o client.cpp
	rpcgen -Ss rpcCracker.x -o server.cpp

clean:
	rm -f client.cpp client.o server.cpp server.o rpcCracker_xdr.* rpcCracker_clnt.* rpcCracker_svc.* rpcCracker.h
