//
//  GSShop.h
//  Coding
//
//  Created by 管章鹏 on 2018/6/4.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSShop : NSObject

/** 名称*/
@property (nonatomic,copy) NSString *name;

/** 图片*/
@property (nonatomic,copy) NSString *icon;

+ (instancetype)shopWithDict:(NSDictionary *)dic;
- (instancetype)initWithDict:(NSDictionary *)dic;
@end
