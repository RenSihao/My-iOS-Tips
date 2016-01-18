//
//  Case1Cell.h
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/************ Model **************/
@interface Case1Model : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end


/************ Cell ***************/

typedef void(^Case1CellBlock)(NSIndexPath *indexPath);


@interface Case1Cell : UITableViewCell

@property (nonatomic, copy) Case1CellBlock block;
@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)updateModel:(Case1Model *)model; //更新数据

/**
 *  拿到数据模型配置cell
 *
 *  @param model <#model description#>
 */
- (void)configureWithModel:(Case1Model *)model;
@end
