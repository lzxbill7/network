#include    "ourhdr.h"

/* Write "n" bytes to a descriptor. */
size_t writen(int fd, const void *vptr, size_t n)
{
    size_t nleft, nwritten;
    const char *ptr;

    ptr = vptr; /* can't do pointer arithmetic on void* */
    nleft = n;
    while (nleft > 0) {
        if ( (nwritten = write(fd, ptr, nleft)) <= 0)
            return(nwritten);       /* error *///返回已经写了多少字节

        nleft -= nwritten;
        ptr   += nwritten;
    }
    return(n);//写了n个字节
}
