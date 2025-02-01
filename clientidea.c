#include<io.h>
#include<stdio.h>
#include<winsock2.h>
#include<string.h>

#define port 8989
#define ip "127.0.0.1"

SOCKET client;
struct sockaddr_in self;
WSADATA wsa;
int main(){
if((WSAStartup(MAKEWORD(2,2),&wsa)) != 0){
    puts("Error Initalizing");
    return 1;
}
puts("Initalized");

if((client = socket(AF_INET,SOCK_STREAM,0)) < 0){
    puts("Error creating client");
    exit(errno);
}
puts("Socket created");
memset(&self,0,sizeof(self));
self.sin_family = AF_INET;
self.sin_port = htons(port);
self.sin_addr.s_addr = inet_addr(ip);

if((connect(client,(struct sockaddr*)&self,sizeof(self))) != 0){
    puts("Error connecting");
    exit(errno);
}
 else{
    puts("<<<<CONNECTED>>>>");
 }
 char sendbuf[256];
 char buffer[256];
 while(1){
    gets(sendbuf);
    send(client,sendbuf,256,0);
    printf("\nserver: %s\n",sendbuf);
    if((strncmp(sendbuf,"goodbye",7)) != 0 ){
    recv(client,buffer,256,0);
    printf("\nclient: %s\n",buffer);
    if((strncmp(buffer,"goodbye",7)) != 0){
        continue;
    }
    else{
        closesocket(client);
        break;
    }
    }

    else{
        closesocket(client);
        break;
    }
}
return 0;
}
