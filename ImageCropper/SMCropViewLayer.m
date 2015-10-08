//
//  SMCropViewLayer.m
//  ImageCropper
//
//  Created by Evan on 14-8-22.
//  Copyright (c) 2014年 sxmobi. All rights reserved.
//

#import "SMCropViewLayer.h"
#import <QuartzCore/QuartzCore.h>
@implementation SMCropViewLayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _cropRect = CGRectMake(0, 0, 0, 0);
    }
    leftTopCorner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"corner.png"]];
    leftTopCorner.layer.shadowColor = [UIColor blackColor].CGColor;
    leftTopCorner.layer.shadowOffset = CGSizeMake(1, 1);
    leftTopCorner.layer.shadowOpacity = 0.6;
    leftTopCorner.layer.shadowRadius = 1.0;
    
    leftBottomCorner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"corner.png"]];
    leftBottomCorner.layer.shadowColor = [UIColor blackColor].CGColor;
    leftBottomCorner.layer.shadowOffset = CGSizeMake(1, 1);
    leftBottomCorner.layer.shadowOpacity = 0.6;
    leftBottomCorner.layer.shadowRadius = 1.0;
    
    rightTopCorner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"corner.png"]];
    rightTopCorner.layer.shadowColor = [UIColor blackColor].CGColor;
    rightTopCorner.layer.shadowOffset = CGSizeMake(1, 1);
    rightTopCorner.layer.shadowOpacity = 0.6;
    rightTopCorner.layer.shadowRadius = 1.0;
    
    rightBottomCorner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"corner.png"]];
    rightBottomCorner.layer.shadowColor = [UIColor blackColor].CGColor;
    rightBottomCorner.layer.shadowOffset = CGSizeMake(1, 1);
    rightBottomCorner.layer.shadowOpacity = 0.6;
    rightBottomCorner.layer.shadowRadius = 1.0;
    
    [self addSubview:leftTopCorner];
    [self addSubview:leftBottomCorner];
    [self addSubview:rightTopCorner];
    [self addSubview:rightBottomCorner];
    
    return self;
}

- (void)setCropRegionRect:(CGRect)cropRect
{
    _cropRect = cropRect;
    
    leftTopCorner.center = _cropRect.origin;
    leftBottomCorner.center = CGPointMake(_cropRect.origin.x , _cropRect.origin.y + _cropRect.size.height);
    rightTopCorner.center = CGPointMake(_cropRect.origin.x + _cropRect.size.width , _cropRect.origin.y);
    rightBottomCorner.center = CGPointMake(_cropRect.origin.x + _cropRect.size.width , _cropRect.origin.y + _cropRect.size.height);
}

-(void) drawRect:(CGRect)rect2
{
    [super drawRect:rect2];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = _cropRect;
    
    CGContextSetRGBFillColor(context,   0.8, 0.8, 0.8, 0.2);
    CGContextSetRGBStrokeColor(context, 0.9, 0.9, 0.9, 1.0);
    
    CGFloat lengths[2];
    lengths[0] = 0.0;
    lengths[1] = 3.0 * 2;
    //    CGContextSetLineCap(context, kCGLineCapRound);
    //    CGContextSetLineWidth(context, 3.0);
    //    CGContextSetLineDash(context, 0.0f, lengths, 2);
    
    
    float w = self.bounds.size.width;
    float h = self.bounds.size.height;
    
    CGRect clips2[] =
	{
        CGRectMake(0, 0, w, rect.origin.y),
        CGRectMake(0, rect.origin.y,rect.origin.x, rect.size.height),
        CGRectMake(0, rect.origin.y + rect.size.height, w, h-(rect.origin.y+rect.size.height)),
        CGRectMake(rect.origin.x + rect.size.width, rect.origin.y, w-(rect.origin.x + rect.size.width), rect.size.height),
	};
    
    CGContextSetLineCap(context, kCGLineCapRound);  //设置线条终点形状
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineDash(context, 0, lengths, 2);  //画虚线
    
    //画横虚线
    for(int i = 1 ; i < 3; i++){
        CGContextMoveToPoint(context, rect.origin.x + (rect.size.width/3)*i, rect.origin.y);    //开始画线
        CGContextAddLineToPoint(context, rect.origin.x + (rect.size.width/3)*i, rect.origin.y + rect.size.height);
        CGContextStrokePath(context);
    }
    //画竖直虚线
    for(int i = 1; i < 3; i++){
        CGContextMoveToPoint(context, rect.origin.x , rect.origin.y+ (rect.size.height/3)*i);    //开始画线
        CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y+ (rect.size.height/3)*i);
        CGContextStrokePath(context);
        
    }
    
    CGContextClipToRects(context, clips2, sizeof(clips2) / sizeof(clips2[0]));
    CGContextFillRect(context, self.bounds);
    CGContextStrokeRect(context, rect);
    UIGraphicsEndImageContext();
}


@end
