//
//  GSShopVC.m
//  Coding
//
//  Created by 管章鹏 on 2018/6/4.
//  Copyright © 2018年 管章鹏. All rights reserved.
//

#import "GSShopVC.h"
#import "GSShopView.h"
#import "GSShop.h"
#import "GSShopView2.h"
@interface GSShopVC ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UILabel *HUD;
@property (strong, nonatomic) NSArray *shops;
@property (weak, nonatomic) UIButton *addButton;
@property (weak, nonatomic) UIButton *removeButton;


@end

@implementation GSShopVC

static NSInteger columnNum = 3;

#pragma 数据懒加载
-(NSArray *)shops{
    if (!_shops) {
        NSArray *shopsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shops" ofType:@"plist"]];
        
        NSMutableArray *array = [NSMutableArray array];
        for (int i=0; i<shopsArray.count; i++) {
            GSShop *shop = [[GSShop alloc] initWithDict:shopsArray[i]];
            [array addObject:shop];
        }
        _shops = array;
    }
    return  _shops;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI{

    self.view.backgroundColor = [UIColor grayColor];
    self.removeButton.enabled = NO;
    
    //添加两个按钮
  self.addButton =  [self buttonWithImage:@"add" highlightedImage:@"add_highlighted" disableImage:@"add_disable" frame:CGRectMake(30, 30, 50, 50) action:@selector(addShop)];
   self.removeButton = [self buttonWithImage:@"remove" highlightedImage:@"remove_highlighted" disableImage:@"remove_disable" frame:CGRectMake(270, 30, 50, 50) action:@selector(removeShop)];
    
}
-(UIButton *)buttonWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage disableImage:(NSString *)disableImage frame:(CGRect)frame action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageNamed:disableImage] forState:UIControlStateDisabled];
    button.frame = frame;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
     return button;
}
#pragma mark 添加
-(void)addShop{
    
    CGFloat shopW = 80;
    CGFloat shopH = 90;
    
    NSInteger index = self.shopsView.subviews.count;
    CGFloat margin = (self.shopsView.frame.size.width - shopW*columnNum)/(columnNum -1);
    
    NSInteger column = index % columnNum;
    NSInteger row = index / columnNum;
    CGFloat shopX = column * (shopW + margin);
    CGFloat shopY = row * (shopH +margin);
    
    //创建View
//    GSShopView *shopView = [[GSShopView alloc] init];
    
    //使用XIB文件的方式
    GSShopView2 *shopView = [GSShopView2 shopView];
    shopView.shop = self.shops[index];

    shopView.frame = CGRectMake(shopX, shopY, shopW, shopH);
    
    [self.shopsView addSubview:shopView];
    
    [self checkState];
}
#pragma mark 删除
-(void)removeShop{
    [self.shopsView.subviews.lastObject removeFromSuperview];
    [self checkState];
}
#pragma mark 检查状态：按钮状态
-(void)checkState{
    // 删除按钮什么时候可以点击：商品个数 > 0
    self.removeButton.enabled = (self.shopsView.subviews.count > 0);
    
    // 添加按钮什么时候可以点击：商品个数 < 总数
    self.addButton.enabled = (self.shopsView.subviews.count < self.shops.count);
    
    //控制指示器的显示和隐藏
    NSString *text = nil;
    if(!self.removeButton.enabled){
        text = @"已经全部删除";
    }
    if (!self.addButton.enabled){
         text = @"已经加满了哦~";
    }
    
    if(text == nil) return;
    
    self.HUD.text = text;
    self.HUD.alpha = 1.0;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.HUD.alpha = 0.0;
    });
    
    
}
@end
