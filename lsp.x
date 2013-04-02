struct Client{
	string host<64>;
	int port;
	int status;
	int id;
};

struct lsp_client{
    string payload<64>;
    int length;
    Client client;
};

struct lsp_message{
	int connid;
	int msg_seq_num;
	string data<64>;
};

program LSP{
	version INITIAL_VERS{
		void write(lsp_client)	=	1;
		lsp_message read()	=	2;
	} = 2;
} = 0x33312345;