//
//  GSShopView2.m
//  Coding
//
//  Created by 管章鹏 on 2018/6/5.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import "GSShopView2.h"
#import "GSShop.h"

@interface GSShopView2()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation GSShopView2

+(instancetype)shopView{
    return [self shopViewWithShop:nil];
}

+(instancetype)shopViewWithShop:(GSShop *)shop{
    //加载xib文件
   GSShopView2 *shopView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    shopView.shop = shop;
    return  shopView;
}

-(void)setShop:(GSShop *)shop{
    _shop = shop;
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
}
@end
