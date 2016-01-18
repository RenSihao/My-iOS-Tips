//
//  RootViewController.m
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "RootViewController.h"
#import "Case1ViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) NSMutableArray *tips;
@end

@implementation RootViewController


#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"My iOS Tips";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


#pragma mark - lazy laod

- (NSMutableArray *)tips
{
    if (!_tips)
    {
        _tips = [NSMutableArray array];
        [_tips addObject:@"UITableView Cell 动态高度布局 "];
        [_tips addObject:@"UITableView Cell 二级菜单"];
        [_tips addObject:@"LoopScrollerView 无限轮播"];
        [_tips addObject:@"..."];
    }
    return _tips;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.tips[indexPath.row];
    return  cell;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            Case1ViewController *case1VC = [[Case1ViewController alloc] init];
            [self.navigationController pushViewController:case1VC animated:YES];
        }
            break;
            
        default:
            break;
    }
}






















@end
