
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import "MzhNet.h"

//----------------------------------------

%hook SpringBoard

//类变量定义
MzhNet* g_net;

-(void)applicationDidFinishLaunching:(id)application
{
    %log;
    %orig;
    
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

%end

