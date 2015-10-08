//
//  SMViewController.m
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import "SMViewController.h"
@interface SMViewController ()

@property (nonatomic, strong) UIImageView   *croperImageView;
@end

@implementation SMViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIButton    *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 400, 110, 30);
    button.layer.cornerRadius = 3.f;
    [button setTintColor:[UIColor colorWithRed:0.069 green:0.185 blue:0.112 alpha:1.000]];
    [button setTitle:@"去设置图片吧" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:1.000 green:0.445 blue:0.504 alpha:1.000]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    _imgCroperVC =[[SMImageCroperViewController alloc] init];
    _imgCroperVC.delegate = self;


}


- (void)buttonAction:(UIButton  *)button{
    
    [self.navigationController pushViewController:_imgCroperVC animated:YES];
}


#pragma mark -  GetCropperImageDelegate
- (void)deliveryCopperImage:(UIImage *)image{
  
    if(_croperImageView.image){
        _croperImageView.image = nil;
    }
    if(image){
        _croperImageView = [[UIImageView alloc] initWithImage:image];
        _croperImageView.layer.cornerRadius = (image.size.height + image.size.width)/4;
        UIImage *image1 = image;
        CGPoint center = self.view.center;
        center.y -= 30;
        [_croperImageView setCenter:center];
        [_croperImageView setImage:image1];
        [self.view addSubview:_croperImageView];
    }
}





@end
