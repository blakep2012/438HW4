CC = gcc
CFLAGS = -g -DRPC_SVC_FG

all: client server

client: client.o rcp_lsp_clnt.o rcp_lsp_xdr.o
	$(CC) $(CFLAGS) -o client client.o rcp_lsp_clnt.o rcp_lsp_xdr.o -lnsl

server: server.o rcp_lsp_svc.o  rcp_lsp_xdr.o
	$(CC) $(CFLAGS) -o server server.o rcp_lsp_svc.o rcp_lsp_xdr.o -lnsl

rcp_lsp_svc.o: rcp_lsp.h
	$(CC) $(CFLAGS) -c rcp_lsp_svc.c

rcp_lsp_clnt.o: rcp_lsp.h
	$(CC) $(CFLAGS) -c rcp_lsp_clnt.c

rcp_lsp_xdr.o: rcp_lsp.h
	$(CC) $(CFLAGS) -c rcp_lsp_xdr.c

server.o: server.c rcp_lsp.h
	$(CC) $(CFLAGS) -c server.c

client.o: client.c rcp_lsp.h
	$(CC) $(CFLAGS) -c client.c

rcp_lsp.h: rcp_lsp.x
	rpcgen -C rcp_lsp.x

clean:
	rm -f client client.o server server.o rcp_lsp_xdr.* rcp_lsp_clnt.* rcp_lsp_svc.* rcp_lsp.h
