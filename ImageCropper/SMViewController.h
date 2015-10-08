//
//  SMViewController.h
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMImageCropperView.h"
#import "SMImageCroperViewController.h"

@interface SMViewController : UIViewController<GetCropperImageDelegate>

@property (nonatomic, strong) UIImage                       *cropperImage;
@property (nonatomic, strong) SMImageCroperViewController   *imgCroperVC;
@end
