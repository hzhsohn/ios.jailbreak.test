//
//  main.m
//  grabZApp
//
//  Created by Han.zh on 15/7/5.
//  Copyright (c) 2015年 Han.zhihong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
#if 0
    //ARC模式
    @autoreleasepool {
        NSString* string = [[NSBundle mainBundle]pathForResource:@"grabZApp_" ofType:nil];
        argv[0] = (char*)[string UTF8String];
        execve([string UTF8String], argv, NULL);
        return 0;
    }
    
#else
    setuid(0);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
#endif
    
}
