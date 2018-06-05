//
//  GSShop.m
//  Coding
//
//  Created by 管章鹏 on 2018/6/4.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import "GSShop.h"

@implementation GSShop

+ (instancetype)shopWithDict:(NSDictionary *)dic{
    return [[self alloc] initWithDict:dic];
}

-(instancetype)initWithDict:(NSDictionary *)dic{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}
@end
