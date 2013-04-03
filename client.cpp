/*
 * This is sample code generated by rpcgen.
 * These are only templates and you can use them
 * as a guideline for developing your own functions.
 */

#include "rpc_lsp.h"


void
lsp_2(char *host)
{
	CLIENT *clnt;
	void  *result_1;
	lsp_client  write_2_arg;
	lsp_message  *result_2;
	char *read_2_arg;

#ifndef	DEBUG
	clnt = clnt_create (host, LSP, INITIAL_VERS, "udp");
	if (clnt == NULL) {
		clnt_pcreateerror (host);
		exit (1);
	}
#endif	/* DEBUG */

	result_1 = write_2(&write_2_arg, clnt);
	if (result_1 == (void *) NULL) {
		clnt_perror (clnt, "call failed");
	}
	result_2 = read_2((void*)&read_2_arg, clnt);
	if (result_2 == (lsp_message *) NULL) {
		clnt_perror (clnt, "call failed");
	}
#ifndef	DEBUG
	clnt_destroy (clnt);
#endif	 /* DEBUG */
}


int
main (int argc, char *argv[])
{
	char *host;

	if (argc < 2) {
		printf ("usage: %s server_host\n", argv[0]);
		exit (1);
	}
	host = argv[1];
	lsp_2 (host);
exit (0);
}