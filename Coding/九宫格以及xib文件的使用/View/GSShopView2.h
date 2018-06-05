//
//  GSShopView2.h
//  Coding
//
//  Created by 管章鹏 on 2018/6/5.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GSShop;
@interface GSShopView2 : UIView

/**模型对象*/
@property (nonatomic, strong) GSShop *shop;

//为了让外界在调用的时候方便可以提供两个创建View的方法
+ (instancetype) shopViewWithShop:(GSShop *)shop;
+ (instancetype) shopView;
@end
