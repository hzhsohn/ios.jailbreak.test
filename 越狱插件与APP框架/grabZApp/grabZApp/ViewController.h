//
//  ViewController.h
//  grabZApp
//
//  Created by Han.zh on 15/7/2.
//  Copyright (c) 2015年 Han.zhihong. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "socket.h"

@interface ViewController : UIViewController
{
    NSTimer *_timer;
    SOCKET _udp;
}


@end

