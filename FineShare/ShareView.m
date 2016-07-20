//
//  ShareView.m
//  FineShareDemo
//
//  Created by xiaopi on 16/7/20.
//  Copyright © 2016年 fine. All rights reserved.
//

#import "ShareView.h"
#import "BaseButton.h"
#import <UMSocialQQHandler.h>
#import <WXApi.h>
#import <WeiboSDK.h>
#define ShareScreenWidth [[UIScreen mainScreen] bounds].size.width

@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * shareLeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, ShareScreenWidth, 15)];
        shareLeLabel.text = NSLocalizedString(@"分享到", nil);
        shareLeLabel.textColor = [UIColor grayColor];
        shareLeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:shareLeLabel];
        [self addbuttons];
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelBtn.frame = CGRectMake(0, self.frame.size.height - 50, self.frame.size.width, 50);
        [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [cancelBtn setTitle:NSLocalizedString(@"取消", nil) forState:UIControlStateNormal];
        cancelBtn.tag = ShareButtonTypeCancel;
        [cancelBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
    }
    return self;
}
- (void)addbuttons{
    [self.buttons removeAllObjects];
    if ([WeiboSDK isWeiboAppInstalled]) {
        BaseButton *weiboB = [[BaseButton alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        [weiboB setImage:[UIImage imageNamed:@"b"] forState:UIControlStateNormal];
        [weiboB setTitle:@"微博" forState:UIControlStateNormal];
        weiboB.tag = ShareButtonTypeWeibo;
        [weiboB addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:weiboB];
    }
    if ([WXApi isWXAppInstalled]) {
        BaseButton *weixinB = [[BaseButton alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        [weixinB setImage:[UIImage imageNamed:@"w"] forState:UIControlStateNormal];
        [weixinB setTitle:@"微信" forState:UIControlStateNormal];
        [weixinB addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        weixinB.tag = ShareButtonTypeWeixin;
        [self.buttons addObject:weixinB];
        BaseButton *friendB = [[BaseButton alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        [friendB setImage:[UIImage imageNamed:@"f"] forState:UIControlStateNormal];
        [friendB setTitle:@"朋友圈" forState:UIControlStateNormal];
        [friendB addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        friendB.tag = ShareButtonTypeFriend;
        [self.buttons addObject:friendB];
    }
    if ([TencentOAuth iphoneQQInstalled]) {
        BaseButton *qqB = [[BaseButton alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        [qqB setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
        [qqB setTitle:@"QQ" forState:UIControlStateNormal];
        [qqB addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        qqB.tag = ShareButtonTypeQQ;
        [self.buttons addObject:qqB];
        BaseButton *qzoneB = [[BaseButton alloc] initWithFrame:CGRectMake(0, 0, 50, 80)];
        [qzoneB setImage:[UIImage imageNamed:@"Z"] forState:UIControlStateNormal];
        [qzoneB setTitle:@"QQ空间" forState:UIControlStateNormal];
        [qzoneB addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        qzoneB.tag = ShareButtonTypeQZone;
        [self.buttons addObject:qzoneB];

    }
    
    NSUInteger number = self.buttons.count;
    switch (number)
    
    {
        case 0:
            
            
            
            break;
            
        case 1:{
            
            BaseButton *btn = [self.buttons objectAtIndex:0];
            btn.center = CGPointMake(ShareScreenWidth/2, 90);
            [self addSubview:btn];
            break;
        }
        case 2:
        {
            
            for (int i = 0; i < self.buttons.count; i ++) {
                BaseButton *btn = [self.buttons objectAtIndex:i];
                btn.center = CGPointMake((i*ShareScreenWidth/2)+(ShareScreenWidth/4), 90);
                [self addSubview:btn];
            }
            break;
        }
        case 3:
        {
            for (int i = 0; i < self.buttons.count; i ++) {
                BaseButton *btn = [self.buttons objectAtIndex:i];
                btn.center = CGPointMake((i*(ShareScreenWidth/3))+(ShareScreenWidth/6), 90);
                [self addSubview:btn];
            }
            
            break;
        }
        case 4:
        {
            for (int i = 0; i < self.buttons.count; i ++) {
                BaseButton *btn = [self.buttons objectAtIndex:i];
                btn.center = CGPointMake((i*(ShareScreenWidth/4))+(ShareScreenWidth/8), 90);
                [self addSubview:btn];
            }
            
            break;
        }
        default:
        {
            for (int i = 0; i < self.buttons.count; i ++) {
                BaseButton *btn = [self.buttons objectAtIndex:i];
                btn.center = CGPointMake((i*(ShareScreenWidth/5))+(ShareScreenWidth/10), 90);
                [self addSubview:btn];
            }
            
            break;
        }
            
    }
}

- (void)shareAction:(UIButton *)sender{
    UIButton *btn = sender;
    if (self.sDelegate) {
        [self.sDelegate actionType:btn.tag];
    }
}

-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray new];
    }
    return _buttons;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
