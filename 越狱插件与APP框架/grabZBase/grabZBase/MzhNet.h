//
//  MzhNet.h
//  grabZBase
//
//  Created by Han.zh on 15/7/2.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "socket.h"

@class SpringBoard;
@interface MzhNet : NSObject
{
    NSTimer *_timer;
    SOCKET _udp;
}

@property(nonatomic,assign) SpringBoard* target;

-(void) setTarget:(SpringBoard*)tg;

-(void) fuckThread: (NSTimer *) timer;
-(void)recvNet:(unsigned char*)buf :(int)len :(struct sockaddr_in *)addr;

//------------------



@end
