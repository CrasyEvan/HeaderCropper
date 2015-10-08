//
//  SMImageCroperViewController.h
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMImageCropperView.h"

@protocol GetCropperImageDelegate <NSObject>

- (void)deliveryCopperImage:(UIImage *)image;
@end

@interface SMImageCroperViewController : UIViewController
{
    SMImageCropperView  *_imageCropper;
}


@property (nonatomic, assign)id<GetCropperImageDelegate> delegate;
@end
