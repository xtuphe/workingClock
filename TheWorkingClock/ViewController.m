//
//  ViewController.m
//  TheWorkingClock
//
//  Created by Xtuphe on 2017/3/8.
//  Copyright © 2017年 Xtuphe. All rights reserved.
//

#import "ViewController.h"
#import "TimeCellView.h"

@interface ViewController ()

@property NSString *tmpTime;
@property NSMutableArray *data;
@property NSMutableArray *date;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.theTableView.dataSource = self;
    self.theTableView.delegate = self;
    // Do any additional setup after loading the view.
    self.data = [NSMutableArray new];
    self.date = [NSMutableArray new];
    [self.theTableView setHeaderView:nil];
//    self.theTableView.headerView.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recordTime) name:@"recordTime" object:nil];
}

- (void)recordTime{
    NSLog(@"%s\t%d\n......%@",__func__,__LINE__,self.data);
    [self getDate];
    [self getTime];
    [self insertCell];
}

- (void)getDate{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"dd"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    [self.date addObject:locationString];
}

- (void)getTime{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    [self.data addObject:locationString];
}

- (void)insertCell{
    
    [self.theTableView reloadData];
    
    [self.theTableView scrollRowToVisible:self.data.count - 1];
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return self.data.count;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 70;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    TimeCellView *cell = [tableView makeViewWithIdentifier:@"timeCell" owner:self];
    cell.backView.layer.masksToBounds = YES;
    [cell.backView setWantsLayer:YES];
    cell.timeLabel.stringValue = self.data[row];
    cell.dateLabel.stringValue = self.date[row];
    cell.dateLabel.font = [NSFont boldSystemFontOfSize:30];
    cell.timeLabel.font = [NSFont boldSystemFontOfSize:20];
    cell.dateLabel.textColor = [NSColor whiteColor];
    cell.backView.layer.cornerRadius = cell.backView.bounds.size.height / 2.0;
    if ([self.date[row] integerValue] % 2 == 1) {
        [cell.backView.layer setBackgroundColor:[[NSColor colorWithRed:0.7 green:0.7 blue:0.9 alpha:1] CGColor]];
    } else {
        [cell.backView.layer setBackgroundColor:[[NSColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1] CGColor]];
    }
    return cell;
}

//- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
//    
//    TimeCellView *cell = [[TimeCellView alloc] init];
//    NSLog(@"%s\t%d\n......%@",__func__,__LINE__,self.data[row]);
//    cell.timeLabel.placeholderString = self.data[row];
//    cell.dateLabel.placeholderString = self.data[row];
//    return cell;
//}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
