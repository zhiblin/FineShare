//
//  BaseButton.m
//  FineShareDemo
//
//  Created by xiaopi on 16/7/15.
//  Copyright © 2016年 fine. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleY = contentRect.size.height *0.8;
    
    CGFloat titleW = contentRect.size.width;
    
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = CGRectGetWidth(contentRect);
    
    CGFloat imageH = contentRect.size.height * 0.75;
    
    return CGRectMake(0, 0, imageW, imageH);
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
