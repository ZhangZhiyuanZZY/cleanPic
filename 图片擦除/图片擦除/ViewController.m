//
//  ViewController.m
//  图片擦除
//
//  Created by 章芝源 on 16/1/6.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView1;
@property(nonatomic, strong)UIImageView *imageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self setupUI];
}

- (void)setupUI
{
    //设置
    UIImageView *imageView2 = [[UIImageView alloc]init];
    imageView2.image = [UIImage imageNamed:@"2B"];
    imageView2.frame = self.view.bounds;
    imageView2.userInteractionEnabled = YES;
    self.imageView2 = imageView2;
    [self.view addSubview:imageView2];

    UIImageView *imageView1 = [[UIImageView alloc]init];
    imageView1.image = [UIImage imageNamed:@"2A"];
    imageView1.frame = self.view.bounds;
    imageView1.userInteractionEnabled = YES;
    self.imageView1 = imageView1;
    [self.view addSubview:imageView1];
    
    //添加手势
    UIPanGestureRecognizer *panxxx = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(setPan:)];
    
    [self.view addGestureRecognizer:panxxx];
}

- (void)setPan:(UIPanGestureRecognizer *)pan
{
    //1. 获取点击点
    CGPoint click = [pan locationInView:self.imageView1];
    //2. 开启上下文
    UIGraphicsBeginImageContext(self.imageView1.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageView1 drawRect:self.imageView1.bounds];
    //3. 设置清除范围
    CGRect cleanRect = CGRectMake(click.x - 10, click.y - 10, 20, 20);
    //4. 清除
    CGContextClearRect(ctx, cleanRect);
    //5. 结束
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView1.image = image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
