CC = g++
CFLAGS = -g -DRPC_SVC_FG

rpc_lsp_svc.o: rpc_lsp.h
	$(CC) $(CFLAGS) -c rpc_lsp_svc.c

rpc_lsp_clnt.o: rpc_lsp.h
	$(CC) $(CFLAGS) -c rpc_lsp_clnt.c

rpc_lsp_xdr.o: rpc_lsp.h
	$(CC) $(CFLAGS) -c rpc_lsp_xdr.c

server.o: rpc_lsp.h
	$(CC) $(CFLAGS) -c server.cpp

client.o: rpc_lsp.h
	$(CC) $(CFLAGS) -c client.cpp

rpc_lsp.h: rpc_lsp.x
	rpcgen -C rpc_lsp.x
	rpcgen -Sc rpc_lsp.x -o client.cpp
	rpcgen -Ss rpc_lsp.x -o server.cpp

clean:
	rm -f client.cpp client.o server.cpp server.o rpc_lsp_xdr.* rpc_lsp_clnt.* rpc_lsp_svc.* rpc_lsp.h
