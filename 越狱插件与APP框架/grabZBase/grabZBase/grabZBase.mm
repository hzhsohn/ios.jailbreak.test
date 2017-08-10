#line 1 "/Users/hzh/Desktop/越狱插件与APP/grabZBase/grabZBase/grabZBase.xm"




#import <UIKit/UIKit.h>
#import "MzhNet.h"



#include <logos/logos.h>
#include <substrate.h>
@class SpringBoard; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(SpringBoard*, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(SpringBoard*, SEL, id); 

#line 10 "/Users/hzh/Desktop/越狱插件与APP/grabZBase/grabZBase/grabZBase.xm"



MzhNet* g_net;


static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(SpringBoard* self, SEL _cmd, id application) {
    NSLog(@"-[<SpringBoard: %p> applicationDidFinishLaunching:%@]", self, application);
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"grabZBase"
                                message:[NSString stringWithFormat:@"HOOK成功"]
                               delegate:nil
                      cancelButtonTitle:@"Thanks"
                      otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    g_net=[[MzhNet alloc] init];
    [g_net setTarget:self];
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);} }
#line 34 "/Users/hzh/Desktop/越狱插件与APP/grabZBase/grabZBase/grabZBase.xm"
