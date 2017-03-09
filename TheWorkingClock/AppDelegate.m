//
//  AppDelegate.m
//  TheWorkingClock
//
//  Created by Xtuphe on 2017/3/8.
//  Copyright © 2017年 Xtuphe. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NSUserNotificationCenterDelegate>

@property NSInteger today;
@property NSWindow * window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSUserNotification *userNoti = [[NSUserNotification alloc] init];
    userNoti.title = @"来啦！~~~";
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
    [[NSUserNotificationCenter defaultUserNotificationCenter] removeAllDeliveredNotifications];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH"];
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSString *time = [formatter stringFromDate:[NSDate date]];
        NSString *day = [dayFormatter stringFromDate:[NSDate date]];
#if 1
        if ([time integerValue] == 9 && self.today != [day integerValue]) {
#else
        if ([time integerValue] == 13 ) {
#endif
            [[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:userNoti];
            self.today = [day integerValue];
        }
    }];
    [timer fire];
    
    self.window = [[[NSApplication sharedApplication] windows] lastObject];
    
}
                      
- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification{
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification{
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification{
    
    return YES;
}


                      
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)applicationWillBecomeActive:(NSNotification *)notification{
}

-(void)applicationDidHide:(NSNotification *)notification{
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    [self.window makeKeyAndOrderFront:self.window];
    return YES;
}

- (void)applicationDidBecomeActive:(NSNotification *)notification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"recordTime" object:nil];
}

- (void)applicationWillResignActive:(NSNotification *)notification{
}

@end
