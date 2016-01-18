//
//  Case1ViewController.m
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Case1ViewController.h"
#import "Case1Cell.h"

static NSString *identifer = @"Case1Cell";

@interface Case1ViewController ()

@property (nonatomic, strong) NSMutableDictionary *cacheCellsDict; //把需要显示的cell都放进缓存
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation Case1ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //加载数据
    [self dataArray];
    
    //刷新tableview
    [self.tableView reloadData];
}



#pragma mark - lazy laod

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray array];
        for (NSUInteger i=0; i<30; i++)
        {
            Case1Model *model = [[Case1Model alloc] init];
            model.title = [NSString stringWithFormat:@"title %ld", i];
            model.content = [NSString repeateString:@"content," count:i];
            [_dataArray addObject:model];
        }
        
    }
    return _dataArray;
}
- (NSMutableDictionary *)cacheCellsDict
{
    if (!_cacheCellsDict)
    {
        _cacheCellsDict = [NSMutableDictionary dictionary];
    }
    return _cacheCellsDict;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存里取
    Case1Cell *cell = [self getCellFromCacheWithIndexPath:indexPath];
    
    [cell setBlock:^(NSIndexPath *indexPath) {
        //此处拿到回调值 干你想干的
    }];
    
    return cell;
}

/**
 *  注意：多次调用dequeueReusableCellWithIdentifier:forIndexPath: 方法会产生不同的Cell，即便是IndexPath是一样的！！！
 *  所以必须保证一个indePath只调用一次dequeueReusableCellWithIdentifier:forIndexPath:这个方法！！！
 *
 *   heightForRowAtIndexPath 方法内 调用 dequeueReusableCellWithIdentifier:forIndexPath:方法，会出现栈溢出问题，但是调用dequeueReusableCellWithIdentifier 并没有问题！！！
 *   所以必须保证 缓存方法里不能调用 dequeueReusableCellWithIdentifier:forIndexPath:！！！
 
 *   同时，系统调用顺序，heightForRowAtIndexPath方法 先调用，cellForRowAtIndexPath 后调用！！！
 *   而且系统默认会一次性计算好所有的cell高度，为了优化性能，实现estimatedHeightForRowAtIndexPath 方法给一个估计值，就会在需要显示这行cell的时候再去计算这行cell高度
 */

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存里取
    Case1Cell *cell = [self getCellFromCacheWithIndexPath:indexPath];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    [cell.contentView setNeedsUpdateConstraints];
    [cell.contentView updateConstraintsIfNeeded];
    
    //利用 systemLayoutSizeFittingSize
    CGFloat cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return cellHeight + 1;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - private method

- (void)addCellToCache:(Case1Cell *)cell IndexPath:(NSIndexPath *)indexPath
{
    [self.cacheCellsDict setObject:cell forKey:[NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row]];
}

- (Case1Cell *)getCellFromCacheWithIndexPath:(NSIndexPath *)indexPath
{
    
    Case1Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell)
    {
        cell = [[Case1Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        //第一次创建这个cell立即添加到缓存中
        [self addCellToCache:cell IndexPath:indexPath];
    }
    //拿到对应数据模型进行cell配置
    Case1Model *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell configureWithModel:model];
    return cell;
}




#pragma mark - public method 



























@end
