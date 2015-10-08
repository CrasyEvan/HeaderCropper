//
//  SMImageCroperViewController.m
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import "SMImageCroperViewController.h"
#import "SMViewController.h"
@interface SMImageCroperViewController ()

@end

@implementation SMImageCroperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageCropper = [[SMImageCropperView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageCropper];
    [_imageCropper setImage:[UIImage imageNamed:@"sample1.jpg"]];
    [_imageCropper setCropRegionRect:CGRectMake(10, 10, 100, 100)];
    
    UIButton    *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, self.view.frame.size.height - 35, 110, 30);
    button.layer.cornerRadius = 3.f;
    [button setTintColor:[UIColor colorWithRed:0.069 green:0.185 blue:0.112 alpha:1.000]];
    [button setTitle:@"去设置封面吧" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:1.000 green:0.445 blue:0.504 alpha:1.000]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}



- (void)buttonAction:(UIButton  *)sender{
    
    UIImage  *imge = [_imageCropper getCroppedImage];
    if(_delegate && [_delegate performSelector:@selector(deliveryCopperImage:) withObject:imge]){
        [_delegate performSelector:@selector(deliveryCopperImage:) withObject:imge];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
