//
//  MzhNet.m
//  grabZBase
//
//  Created by Han.zh on 15/7/2.
//
//

#import <QuartzCore/QuartzCore.h>
#import "MzhNet.h"


@implementation MzhNet
@synthesize target;

-(id)init
{
    if (self=[super init]) {
        
        zhSockInit(&_udp,ZH_SOCK_UDP);
        zhSockBindAddr(_udp,NULL,48748);
        
        _timer = [NSTimer scheduledTimerWithTimeInterval: 0.01//秒
                                                  target: self
                                                selector: @selector(fuckThread:)
                                                userInfo: nil
                                                 repeats: YES];
    }
    return self;
}

-(void) setTarget:(SpringBoard*)tg
{
    target=tg;
}

//----------------------------------------
//线程处理
-(void) fuckThread: (NSTimer *) timer
{
    int ret=0;
    unsigned char buf[1024]={0};
    struct sockaddr_in addr;
    int addrlen=sizeof(struct sockaddr_in);
    
    ret=zhSockRecvFrom/*zhUdpRecvFrom*/(_udp,buf,sizeof(buf),&addr,&addrlen);
    if (ret) {
        [self recvNet:buf :ret :&addr];
    }
}

//发送当前状态
-(void)sendCurStatus:(struct sockaddr_in *)addr
{
    char bf[3]={2,1,1};
    zhSockSendTo(_udp,bf,3,addr);
}

-(void)recvNet:(unsigned char*)buf :(int)len :(struct sockaddr_in *)addr
{
    /*
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"recvNet"
     message:[NSString stringWithFormat:@"grabSetting=%@,buf[%d %d] len=%d",grabSetting,buf[0],buf[1],len]
     delegate:nil
     cancelButtonTitle:@"Thanks"
     otherButtonTitles:nil];
     [alert show];
     [alert release];
     
    */
    int swn=buf[0];
    switch (swn) {
        case 1:
        {
           
        }
            break;
    }
}

@end
