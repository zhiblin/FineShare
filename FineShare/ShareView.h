//
//  ShareView.h
//  FineShareDemo
//
//  Created by xiaopi on 16/7/20.
//  Copyright © 2016年 fine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ShareButtonType) {
    ShareButtonTypeWeibo = 99991,//默认从0开始
    ShareButtonTypeWeixin,
    ShareButtonTypeFriend,
    ShareButtonTypeQQ,
    ShareButtonTypeQZone,
    ShareButtonTypeCancel,
};
@protocol ShareDelegate;

@interface ShareView : UIView


@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, weak) id<ShareDelegate>  sDelegate;

@end

@protocol ShareDelegate <NSObject>

-(void)actionType:(ShareButtonType)shareButtonType;

@end