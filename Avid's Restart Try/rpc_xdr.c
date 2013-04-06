/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "rpc.h"

bool_t
xdr_message (XDR *xdrs, message *objp)
{
	register int32_t *buf;

	int i;

	if (xdrs->x_op == XDR_ENCODE) {
		buf = XDR_INLINE (xdrs, 4 * BYTES_PER_XDR_UNIT);
		if (buf == NULL) {
			 if (!xdr_int (xdrs, &objp->size))
				 return FALSE;
			 if (!xdr_int (xdrs, &objp->seq))
				 return FALSE;
			 if (!xdr_int (xdrs, &objp->id))
				 return FALSE;
			 if (!xdr_long (xdrs, &objp->pronum))
				 return FALSE;

		} else {
		IXDR_PUT_LONG(buf, objp->size);
		IXDR_PUT_LONG(buf, objp->seq);
		IXDR_PUT_LONG(buf, objp->id);
		IXDR_PUT_LONG(buf, objp->pronum);
		}
		 if (!xdr_vector (xdrs, (char *)objp->payload, 2048,
			sizeof (char), (xdrproc_t) xdr_char))
			 return FALSE;
		return TRUE;
	} else if (xdrs->x_op == XDR_DECODE) {
		buf = XDR_INLINE (xdrs, 4 * BYTES_PER_XDR_UNIT);
		if (buf == NULL) {
			 if (!xdr_int (xdrs, &objp->size))
				 return FALSE;
			 if (!xdr_int (xdrs, &objp->seq))
				 return FALSE;
			 if (!xdr_int (xdrs, &objp->id))
				 return FALSE;
			 if (!xdr_long (xdrs, &objp->pronum))
				 return FALSE;

		} else {
		objp->size = IXDR_GET_LONG(buf);
		objp->seq = IXDR_GET_LONG(buf);
		objp->id = IXDR_GET_LONG(buf);
		objp->pronum = IXDR_GET_LONG(buf);
		}
		 if (!xdr_vector (xdrs, (char *)objp->payload, 2048,
			sizeof (char), (xdrproc_t) xdr_char))
			 return FALSE;
	 return TRUE;
	}

	 if (!xdr_int (xdrs, &objp->size))
		 return FALSE;
	 if (!xdr_int (xdrs, &objp->seq))
		 return FALSE;
	 if (!xdr_int (xdrs, &objp->id))
		 return FALSE;
	 if (!xdr_long (xdrs, &objp->pronum))
		 return FALSE;
	 if (!xdr_vector (xdrs, (char *)objp->payload, 2048,
		sizeof (char), (xdrproc_t) xdr_char))
		 return FALSE;
	return TRUE;
}