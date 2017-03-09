//
//  TimeCellView.h
//  TheWorkingClock
//
//  Created by Xtuphe on 2017/3/8.
//  Copyright © 2017年 Xtuphe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TimeCellView : NSTableCellView

@property (weak) IBOutlet NSTextField *dateLabel;
@property (weak) IBOutlet NSTextField *timeLabel;
@property (weak) IBOutlet NSView *backView;


@end
