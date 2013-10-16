# Change the following as required:
CC	= gcc
CFLAGS	= -Wall

#CFLAGS	= -ansi -Wall -Dsun -D__STDC__=0

# My flags for gcc/solaris 2.3:  -ansi -Wall -Dsun -D__STDC__=0
# Add in -DGCC_STRUCT_PROBLEM for gcc versions 1.x under SunOS 4.x
# Add in -D__STDC__=0 for gcc under Solaris 2 (for Sun's screwy headers)
# Add in -D_BSD=44 for AIX 3.2.2 (see <sys/socket.h>)
# Add in -D_SOCKADDR_LEN for DEC OSF/1 (see <sys/socket.h>)

# Following line for SVR4, Solaris 2.x
#LIBS	= /usr/ucblib/libucb.a -lsocket -lnsl
LIBS	= -lnsl

# Following line for 4.4BSD, BSD/386, SunOS 4.x, AIX 3.2.2, OSF/1
#LIBS	=

PROGS =	sock
OBJS = error.o cliopen.o sockopts.o buffers.c main.o

#这些文件不再需要了，linux已经有这些函数库了
#strerror.o writen.o  

#OBJS = buffers.o cliopen.o crlf.o error.o loop.o main.o \
	   servopen.o sockopts.o sourcesink.o strerror.o \
	   tellwait.o writen.o
# Can delete strerror.o on systems that already support it (4.4BSD)

all:	${PROGS}

${OBJS}: sock.h

sock:	${OBJS}
		${CC} ${CCFLAGS} -o $@ ${OBJS} ${LIBS}

clean:
		rm -f ${PROGS} core core.* *.o temp.* *.out typescript*