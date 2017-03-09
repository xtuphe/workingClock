//
//  ViewController.h
//  TheWorkingClock
//
//  Created by Xtuphe on 2017/3/8.
//  Copyright © 2017年 Xtuphe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *theTableView;

@end

