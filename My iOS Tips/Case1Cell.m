//
//  Case1Cell.m
//  My iOS Tips
//
//  Created by RenSihao on 16/1/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Case1Cell.h"

/************ Model **************/

@implementation Case1Model
- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    return self;
}


@end


/************ Cell ***************/

@interface Case1Cell ()

@property (nonatomic, strong) UILabel *titleLab;   //标题标签
@property (nonatomic, strong) UILabel *contentLab; //内容标签
@property (nonatomic, strong) UIButton *checkBtn;  //勾选按钮
@property (nonatomic, strong) Case1Model *model;   //数据模型

@end

@implementation Case1Cell

#pragma mark - 

//无论外界调用哪个初始化方法 系统最终一定会调用此方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.checkBtn];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self);
    }];
    
    //
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLab.mas_bottom);
    }];
    
    //
    [self.checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    
}

#pragma mark - public method

- (void)updateModel:(Case1Model *)model
{
    _model = model;
    self.titleLab.text = _model.title;
    self.contentLab.text = _model.content;
}
- (void)configureWithModel:(Case1Model *)model
{
    _model = model;
    self.titleLab.text = _model.title;
    self.contentLab.text = _model.content;
}

#pragma mark - private method



#pragma mark - lazy load

- (UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [UILabel new];
        _titleLab.font = [UIFont systemFontOfSize:17.f];
        _titleLab.textColor = [UIColor blackColor];
    }
    return _titleLab;
}
- (UILabel *)contentLab
{
    if (!_contentLab)
    {
        _contentLab = [UILabel new];
        _contentLab.font = [UIFont systemFontOfSize:12.f];
        _contentLab.textColor = [UIColor grayColor];
    }
    return _contentLab;
}
- (UIButton *)checkBtn
{
    if (!_checkBtn)
    {
        _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkBtn.layer.cornerRadius = 25;
        _checkBtn.layer.masksToBounds = YES;
        
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        
    }
    return _checkBtn;
}



@end


