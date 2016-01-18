//
//  SHBaseTableViewController.m
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "SHBaseTableViewController.h"

@interface SHBaseTableViewController ()

@end

@implementation SHBaseTableViewController

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init])
    {
        self.title = title;
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (kiOSVersion >= 7.0)
//    {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
    self.tableView.backgroundColor = [UIColor whiteColor];
}


@end
