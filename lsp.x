struct Client{
	string host;
	int port;
	int status;
	int id;
};

struct lsp_client{
    string payload;
    int length;
    Client client;
};

struct lsp_message{
	int connid;
	int msg_seq_num;
	string data;
};

program LSP{
	version INITIAL_VERS{
		void write(lsp_client);
		lsp_message read();
	} = 1;
} = 0x33312345;