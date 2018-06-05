//
//  GSShopView.m
//  Coding
//
//  Created by 管章鹏 on 2018/6/4.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import "GSShopView.h"
#import "GSShop.h"

@interface GSShopView()

/** 图片控件*/
@property (nonatomic, strong) UIImageView *iconView;
/** 图片名称*/
@property (nonatomic, strong) UILabel *nameLabel;

@end
@implementation GSShopView

#pragma mark 控件懒加载 这样更加节约性能,用到的时候再去创建控件;
-(UIImageView *)iconView{
    if (!_iconView) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        _iconView = iconView;
    }
    return _iconView;
}
-(UILabel *)nameLabel{
    if(!_nameLabel){
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:11];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        _nameLabel = nameLabel;
    }
    return  _nameLabel;
}
/**
 init方法内部会自动调用initWithFrame:方法
 */
//-(instancetype)initWithFrame:(CGRect)frame{
//    if(self = [super initWithFrame:frame]){
//
//        //1.0 创建icon
//        UIImageView *iconView = [[UIImageView alloc] init];
//        [self addSubview:iconView];
//        self.iconView = iconView;
//
//        //2.0 创建名称
//        UILabel *nameLabel = [[UILabel alloc] init];
//        nameLabel.font = [UIFont systemFontOfSize:11];
//        nameLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:nameLabel];
//        self.nameLabel = nameLabel;
//    }
//    return self;
//
//}

//设置Frame
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.nameLabel.frame = CGRectMake(0, width, width, height-width);
}

-(void)setShop:(GSShop *)shop{
    _shop = shop;
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
}

@end
