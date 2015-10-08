//
//  SMImageCropperView.h
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMCropViewLayer.h"

#define IMAGE_BOUNDRY_SPACE 10
enum rectPoint { LeftTop = 0, RightTop=1, LeftBottom = 2, RightBottom = 3, MoveCenter = 4, NoPoint = 1};
@interface SMImageCropperView : UIView

{
    UIImageView* _imageView;
    UIImage* _image;
    SMCropViewLayer* _cropView;
    enum rectPoint _movePoint;
    CGRect _cropRect;
    CGRect _translatedCropRect;
    CGPoint _lastMovePoint;
    CGFloat _scalingFactor;
}
- (void)setCropRegionRect:(CGRect)cropRect;
- (void) setImage:(UIImage*)image;
- (void) setFrame:(CGRect)frame;
- (void) reLayoutView;
- (UIImage *)getCroppedImage;
@end
