//
//  SHBaseTableViewController.h
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWeakObject(obj) __weak __typeof(obj) weakObject = obj;
#define kiOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

@interface SHBaseTableViewController : UITableViewController

- (instancetype)initWithTitle:(NSString *)title;

@end
