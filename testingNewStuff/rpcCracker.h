/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#ifndef _RPCCRACKER_H_RPCGEN
#define _RPCCRACKER_H_RPCGEN

#include <rpc/rpc.h>


#ifdef __cplusplus
extern "C" {
#endif


struct Message {
	int connid;
	int msg_seq_num;
	char *data;
};
typedef struct Message Message;

#define rpcCracker 0x33312345
#define CAVERLEE4PRES 1

#if defined(__STDC__) || defined(__cplusplus)
#define read 1
extern  int * read_1(Message *, CLIENT *);
extern  int * read_1_svc(Message *, struct svc_req *);
#define write 2
extern  int * write_1(Message *, CLIENT *);
extern  int * write_1_svc(Message *, struct svc_req *);
extern int rpccracker_1_freeresult (SVCXPRT *, xdrproc_t, caddr_t);

#else /* K&R C */
#define read 1
extern  int * read_1();
extern  int * read_1_svc();
#define write 2
extern  int * write_1();
extern  int * write_1_svc();
extern int rpccracker_1_freeresult ();
#endif /* K&R C */

/* the xdr functions */

#if defined(__STDC__) || defined(__cplusplus)
extern  bool_t xdr_Message (XDR *, Message*);

#else /* K&R C */
extern bool_t xdr_Message ();

#endif /* K&R C */

#ifdef __cplusplus
}
#endif

#endif /* !_RPCCRACKER_H_RPCGEN */
