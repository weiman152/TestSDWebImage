//
//  ViewController.m
//  TestAAAA
//
//  Created by weiman on 2018/1/9.
//  Copyright © 2018年 weiman. All rights reserved.
//

#import "ViewController.h"
//#import "UIImage+WebP.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "UIImage+WebP.h"

#define mScreenWidth [UIScreen mainScreen].bounds.size.width
#define mScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadImageWebp];
}

-(void)loadImage{
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, mScreenWidth-20, 200)];
    [self.view addSubview:imageV];
    imageV.backgroundColor = [UIColor yellowColor];
    
    NSString * imageurl = @"http://images21.happyjuzi.com/test/ea/09/91f522741b7a0976b5f21a3b9f78.jpg!200.nw.webp";
    //NSString * imageurl = @"http://oss.img.2or3m.com/videoimg/php/20171112/5a080c360c6c3.jpg";
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:imageurl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            NSLog(@"--------- %@",error);
        }else{
            NSLog(@"图片加载成功");
        }
    }];
}

-(void)loadImageWebp{
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, mScreenWidth-20, 200)];
    [self.view addSubview:imageV];
    imageV.backgroundColor = [UIColor yellowColor];
    
    NSString * imageurl = @"http://images21.happyjuzi.com/test/ea/09/91f522741b7a0976b5f21a3b9f78.jpg!200.nw.webp";
    NSError * error;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageurl] options:NSDataReadingMappedIfSafe error:&error];
    if (data) {
        UIImage * image = [UIImage sd_imageWithWebPData:data];
        imageV.image = image;
    }else{
        NSLog(@"惨啦，没有拿到数据");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
