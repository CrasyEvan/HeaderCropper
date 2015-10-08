//
//  SMCropViewLayer.h
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMCropViewLayer : UIView

{
    CGRect              _cropRect;
    UIImageView         *leftTopCorner;
    UIImageView         *leftBottomCorner;
    UIImageView         *rightTopCorner;
    UIImageView         *rightBottomCorner;
}
- (void)setCropRegionRect:(CGRect)cropRect;
@end
