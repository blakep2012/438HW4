#include <iostream>
#include "rpcCracker.h"

int main(int argc, char* argv[]){
    // randomization seed requested by Dr. Stoleru
    srand(12345);
    
	CLIENT *client;

    if(argc != 4) {
        printf("Usage: ./request host:port hash len\n");
        return -1;
    }
    
    char* host = argv[1];
    char* hash = argv[2];
    int len = atoi(argv[3]);

    // do not allow passwords longer than 6 characters
    if(len > 6) {
        printf("The password you provided is too large. Maximum password length is 6 characters.\n");
        return -1;
    }
    
    //lsp_set_drop_rate(0.2); // 20% of packets dropped
    //lsp_set_epoch_lth(0.1); // 100 ms per epoch = fast resends on failure
    //lsp_set_epoch_cnt(20); // 20 epochs (2 seconds) with no response
    
    // create a lsp client and connect to server
    /*lsp_client *client = lsp_client_create(argv[1], port);
    if(!client){
        printf("The connection to the server failed. Exiting...\n");
        return -1;
    }*/
	client = clnt_create (host, rpcCracker, CAVERLEE4PRES, "udp");
	if (client == NULL) {
		clnt_pcreateerror (host);
		exit (1);
	}
    
    //printf("The connection to the server has been established\n");
    
    // calculate the lower and upper passwords for a certain length
	char* buffer = new char[1024];
    //char buffer[1024];
    char lower[7];
    char upper[7];
    for(int k = 0; k < len; k++){
        lower[k] = 'a';
        upper[k] = 'z';
    }
    lower[len] = NULL;
    upper[len] = NULL;
    int buflen = sprintf(buffer, "c %s %s %s", hash, lower, upper);
    int bytes_read;

    //printf("sending [%d]: %s\n", buflen, buffer);
    
    // send password crack request to server
    //lsp_client_write(client,(uint8_t*)buffer,buflen+1);
	int id = *write_1(&buffer, client);
    //int bytes_read = lsp_client_read(client,(uint8_t*)buffer);

	char *temp;
	do{
		//&buffer = read_1(&id, client);
		buffer = *read_1(&id, client);

		for(int i = 0; i < 1024; i++){
			if(buffer[i] == NULL){
				bytes_read = i;
				break;
			}
		}
		sleep(1);
	}while(bytes_read == 0);
          
    if(buffer[0] == 'x')
        printf("Not Found\n");
    else if (buffer[0] == 'f')
        printf("Found: %s\n",buffer + 2);
    else
        printf("Unknown response: %s\n",buffer);
  
    //lsp_client_close(client);   
	clnt_destroy(client);
    return 0;
}
