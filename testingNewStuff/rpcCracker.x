struct Message{
	int connid;
	int msg_seq_num;
	string data<64>;
};

program rpcCracker{
	version CAVERLEE4PRES{
		int read(Message)			= 1;
		int write(Message)			= 2;
	} = 1;
} = 0x33312345;