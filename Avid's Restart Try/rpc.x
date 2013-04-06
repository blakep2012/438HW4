struct message{
	int size;
	int seq;
	int id;
	long pronum;
	char payload[2048];
};

program rpcCracker{
	version CAVERLEE4PRES{
		void get(message)		= 1;
	} = 1;
} = 0x33319999;
