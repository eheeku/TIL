#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
//#include <netinet/in.h>
#include <sys/socket.h>
//#include <sys/types.h>

#define PORT 9001

char buffer[BUFSIZ] = "hello,world!";

int main (int argc,char *argv[]) {
    int c_socket, s_socket;#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/ient.h>
#include <sys/soket.h>

#define PORT 9000

char buffer[BUFSIZ] = "hello world!";

int main (int argc,char *argv[]){
	int c_socket, s_socket;
	struct sockaddr_in s_addr,c_addr;
	int len;
	int n;
	/*int socket(int domain, int type, int protocol);
	domain : 인터넷을 툥해 통신할 지, 같은 시스템 내에서 프로세스 끼리 통신할지의 여부
	PF_INET, AF_INET : IPv4 인터넷 프로토콜을 사용합니다.
	PF_INET6 : IPv6 인터넷 프로토콜을 사용합니다.
	PF_LOCAL, AF_UNIX:같은 시스템 내에서 프로세스 끼리 통신합니다.
	PF_PACKET : Low level socket 을 인터페이스를 이용합니다.
	PF_IPX : IPX 노벨 프로토콜을 사용합니다.
	type : 데이터의 전송 형태를 지정하며 아래와 같은 값을 사용,
	SOCK_STREAM : tcp/ip 프로토콜
	SOCK_DGRAM : udp/ip 프로토콜
	int protocol : 통신에 있어서 특정 프로토콜을 사용을 지정하기 위한 변수이며, 보통 0 값 사용
	*/
	
	s_socket = socket(PT_INET,SOCK_STREAM,0);

	/*
	socket은 디스크립터일뿐 소켓에 주소를 할당하고 port 번호를 할당해서
	커널에 등록해야 다른 시스템과 통신할 수 있습니다.

	즉 외부로부터의 자료를 수신할 수 있게 됩니다.
	따라서 sockaddr_in 구조체를 이용한다.
	*/
	memset (&s_addr,0,sizeof(s_addr));

	s_addr.sin_family = AF_INET;	//ipv4 인터넷 프로토콜
	s_addr.sin_addr.s_addr = htonl(INADDR_ANY);	
	// 32bit ipv4 주소 주소를 지정해주는 것으로 inet_addr(내 시스템의 ip)로도 지정가능,
	//그러나 고정 ip로 하지않고 htonl(INADDR_ANY)를 사용하는 것이 편함.
	s_addr.sin_port = htons(PORT);	//사용 할 port 번호 9001
	

	/*
	bind (int sockfd,struct sockaddr *myaddr,socklen_t addrlen);
	int sockfd : 소켓 디스크립터
	struct sockaddr *myaddr : 주소 정보로 인터넷을 이용하는 AF_INET인 경우에는 struct sockaddr_in을 사용합니다
	sockeln_t addrlen :myadd 구조체의 크기
	*/
	if (bind (s_socket,(struct sockaddr *)&s_addr,sizeof(s_addr))==-1){
		print ("can no bind\n");
		return -1;
	}

	/*
	listen(소켓 디스크립터, 대기메세지 큐의 개수)
	*/
	if (listen(s_socket,5)==-1){
		printf("can co lisen\n");
		return -1;
	}

	while (1){
		len = sizeof(c_addr);
		n = strlen(buffer);
		write (c_socket,buffer,n);
		close (c_socket);
	}
	close (s_socket);
	return 0;
}

/*

    struct sockaddr_in s_addr,c_addr;
    int len;
    int n;

    s_socket = socket(PF_INET,SOCK_STREAM,0);

    memset (&s_addr,0,sizeof(s_addr));

    s_addr.sin_family = AF_INET;
    s_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    s_addr.sin_port = htons(PORT);

    if (bind(s_socket, (struct sockaddr *)&s_addr, sizeof(s_addr))==-1) {
        printf("Can no bind \n");
        return -1;
    }

    if(listen(s_socket,5)==-1) {
            printf("listen Fail\n");
            return -1;
    }

    while (1){
    len = sizeof(c_addr);
    c_socket = accept(s_socket,(struct sockaddr *) &c_addr,&len);
    n = strlen(buffer);
    write(c_socket,buffer,n);
    close(c_socket);
    }
close(s_socket);
return 0;
}
*/
