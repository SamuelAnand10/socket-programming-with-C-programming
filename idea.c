#include <stdio.h>
#include<winsock2.h>
#include<io.h>
#include<string.h>


#define maxbuf 256
#define portno 8989

SOCKET server,client;
WSADATA wsa;
struct sockaddr_in self;
char buffer[maxbuf];
int main(){
puts("Initializing...");
if(WSAStartup(MAKEWORD(2,2),&wsa) != 0){
   puts("Error Initializing server");
   exit(errno);
   }
else{
    puts("Server Initialized");
}

if((server = socket(AF_INET,SOCK_STREAM,0)) < 0){
    puts("socket error");
    exit(errno);
}
else{
    puts("socket initialized");
}
self.sin_family = AF_INET;
self.sin_port = htons(portno);
self.sin_addr.s_addr = INADDR_ANY;

if((bind(server,(struct sockaddr*)&self,sizeof(self))) != 0){
    puts("Error Bindind");
    exit(errno);
}
else{
    puts("Binded");

}
if((listen(server,20)) != 0){
    puts("broken ear");
    exit(errno);
}
else{
    puts("<<<<Listening>>>>");
}
struct sockaddr_in client_addr;
int addrlen = sizeof(client_addr);
client = accept(server,(struct sockaddr*)&client_addr,&addrlen);
char sendbuf[256];
while(1){
    recv(client,buffer,256,0);
    printf("\nclient: %s\n",buffer);
    if((strncmp(buffer,"goodbye",7)) != 0 ){
    gets(sendbuf);
    send(client,sendbuf,256,0);
    printf("\nserver: %s\n",sendbuf);
    if((strncmp(sendbuf,"goodbye",7)) != 0){
        continue;
    }
    else{
        closesocket(server);
        break;
    }
    }

    else{
        closesocket(server);
        break;
    }
}
return 0;
}
