//
//  ViewController.m
//  grabZApp
//
//  Created by Han.zh on 15/7/2.
//  Copyright (c) 2015年 Han.zhihong. All rights reserved.
//

#import "ViewController.h"
#include "socket.h"

#define DSTIP "192.168.1.111"
#define DSTPORT 48748
@interface ViewController ()
{
}

-(void) fuckThread: (NSTimer *) timer;
-(void)recvNet:(unsigned char*)buf :(int)len :(struct sockaddr_in *)addr;

- (IBAction)btnSendQQ:(id)sender;

@end

@implementation ViewController

-(void)awakeFromNib
{
}

-(void)dealloc
{
  //  [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    zhSockInit(&_udp,ZH_SOCK_UDP);
    zhSockBindAddr(_udp,NULL,48749);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval: 0.01//秒
                                              target: self
                                            selector: @selector(fuckThread:)
                                            userInfo: nil
                                             repeats: YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(fuckActive:)
                                name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)fuckActive:(NSNotification*)notification
{
    NSLog(@"fuckActive");
    
    //重新初始化UDP
    zhSockInit(&_udp,ZH_SOCK_UDP);
    zhSockBindAddr(_udp,NULL,48749);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)btnSendQQ:(id)sender {
    
    system("mkdir /test");
    system("echo hahaha>~/a.txt");
}

-(void) fuckThread: (NSTimer *) timer
{
    int ret=0;
    unsigned char buf[1024]={0};
    struct sockaddr_in addr;
    int addrlen=sizeof(struct sockaddr_in);
    
    ret=zhSockRecvFrom(_udp,(char*)buf,sizeof(buf),&addr,&addrlen);
    if (ret) {
        [self recvNet:buf :ret :&addr];
    }
}

-(void)recvNet:(unsigned char*)buf :(int)len :(struct sockaddr_in *)addr
{
    int swn=buf[0];
    switch (swn) {
        case 1:
        {
        
        }
            break;
    }
}


@end
