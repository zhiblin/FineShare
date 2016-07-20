//
//  FineShareManager.m
//  FineShareDemo
//
//  Created by xiaopi on 16/7/15.
//  Copyright © 2016年 fine. All rights reserved.
//

#import "FineShareManager.h"
#import <UMSocial.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialQQHandler.h>
#import <WXApi.h>
#import <WeiboSDK.h>
#import "BaseButton.h"
#import "ShareView.h"

@interface FineShareManager ()<ShareDelegate>{
    UIViewController *_shareVC;
    NSString *_title;
    NSString *_content;
    UIImage *_image;
    NSString *_url;
    NSString *_urlResource;
    
    NSString *_sinaContent;
    NSString *_sinaUrl;
    UIImage *_sinaImage;
    
    NSString *_qqContent;
    NSString *_qqUrl;
    UIImage *_qqImage;
    
    NSString *_wxContent;
    NSString *_wxUrl;
    UIImage *_wxImage;
}
@end

@implementation FineShareManager



+ (void)setUMSocialAPPKey:(NSString *)key;{
    [UMSocialData setAppKey:key];
}

+ (void)WXAppid:(NSString *)appid appSecret:(NSString *)appSecret andUrl:(NSString *)url;{
    [UMSocialWechatHandler setWXAppId:appid appSecret:appSecret url:url];
}
+ (void)QQAppid:(NSString *)appid appKey:(NSString *)appKey andUrl:(NSString *)url;{
    [UMSocialQQHandler setQQWithAppId:appid appKey:appKey url:url];
}
+ (void)SinaAppKey:(NSString *)appKey appSecret:(NSString *)appSecret andUrl:(NSString *)url;{
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:appKey secret:appSecret RedirectURL:url];
}


- (instancetype)init{
    self = [super init];
    if (self) {
//        [self creatShareView];
    }
    return self;
}


- (void)setSinaTitle:(NSString *)title;{
    _sinaContent = title;
}

- (void)setSinaImage:(UIImage *)image;
{
    _sinaImage = image;
}
- (void)setSinaUrl:(NSString *)url;{
    _sinaUrl = url;
}



- (void)setQQTitle:(NSString *)title;{
    _qqContent = title;
}

- (void)setQQImage:(UIImage *)image;{
    _qqImage = image;
}

- (void)setQQUrl:(NSString *)url;{
    _qqUrl = url;
}



- (void)setWXTitle:(NSString *)title;{
    _wxContent = title;
}

- (void)setWXImage:(UIImage *)image;{
    _wxImage = image;
}

- (void)setWXUrl:(NSString *)url;{
    _wxUrl = url;
}

- (void)setShareVC:(UIViewController *)vc content:(NSString *)content image:(UIImage *)image url:(NSString *)url{
    _shareVC = vc;
    _content = content;
    _image = image;
    _url = url;
}

- (void)setFullShareVC:(UIViewController *)vc title:(NSString *)title content:(NSString *)content image:(UIImage *)image url:(NSString *)url urlResource:(NSString *)urlResource{
    _urlResource = urlResource;
    _title = title;
    [self setShareVC:vc content:content image:image url:url];
}

- (void)show{
    [self creatShareView];
    self.shareBgView.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.shareBgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.shareView.frame = CGRectMake(0, ScreenHeight - 200, ScreenWidth, 200);
    } completion:^(BOOL finished) {
        
    }];
}


- (void)hiddenShareView{
    [UIView animateWithDuration:0.3 animations:^{
        self.shareBgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.shareView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 200);
    } completion:^(BOOL finished) {
        self.shareBgView.hidden = YES;
        self.shareView = nil;
    }];
}

- (void)postShareWith:(NSArray *)type content:(NSString *)content image:(id)image urlImage:(NSString *)imageUrl{
    if (imageUrl) {
        image = nil;
    }
    UMSocialUrlResource *rs = nil;
    if (imageUrl)
    rs = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:imageUrl];
    [[UMSocialDataService defaultDataService] postSNSWithTypes:type content:content image:image?image:nil location:nil urlResource:rs presentedController:_shareVC completion:^(UMSocialResponseEntity *response){
        [self shareFinishWith:response];
    }];
}

// 分享完成
- (void)shareFinishWith:(UMSocialResponseEntity *)response{
    if (response.responseCode == UMSResponseCodeSuccess) {
        NSLog(@"分享成功！");
    }else if (response.responseCode == UMSResponseCodeCancel) {
        NSLog(@"取消");
    }else {
        NSLog(@"失败");
    }
}


-(UIView *)shareBgView{
    if (!_shareBgView) {
        _shareBgView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [[[UIApplication sharedApplication] keyWindow] addSubview:_shareBgView];
    }
    return _shareBgView;
}

- (UIView *)shareView{
    if (!_shareView) {
        _shareView = [[ShareView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 200)];
        _shareView.backgroundColor = [UIColor whiteColor];
        _shareView.sDelegate = self;
    }
    return _shareView;
}

- (void)creatShareView{
    
    [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:self.shareBgView];
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 200)];
    topView.userInteractionEnabled = YES;
    [self.shareBgView addSubview:topView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenShareView)];
    [topView addGestureRecognizer:tap];
    
    [self.shareBgView addSubview:self.shareView];

    self.shareBgView.hidden = YES;
}


#pragma mark sharedelegate

-(void)actionType:(ShareButtonType)shareButtonType{
    [self hiddenShareView];
    NSString * titleStr = _title;
    NSString * contentStr = _content;
    NSString * urlStr = _url;
    UIImage  * image = _image;
    NSString * imageUrl = _urlResource;
    NSArray *shareType;
   
    switch (shareButtonType) {
        case ShareButtonTypeWeibo:
        {
            // 微博
            contentStr = _sinaContent?_sinaContent:titleStr;
            shareType = @[UMShareToSina];
            break;
        }
        case ShareButtonTypeQQ:
        {
            // QQ
            shareType = @[UMShareToQQ];
            [UMSocialData defaultData].extConfig.qqData.url = urlStr;
            [UMSocialData defaultData].extConfig.qqData.title = titleStr;
            break;
        }
        case ShareButtonTypeQZone:
        {
            // QQ空间
            shareType = @[UMShareToQzone];
            [UMSocialData defaultData].extConfig.qzoneData.url = urlStr;
//                [UMSocialData defaultData].extConfig.qzoneData.title = titleStr;
            [UMSocialData defaultData].extConfig.title = titleStr;
            break;
        }
        case ShareButtonTypeWeixin:
        {
            // 微信
            shareType = @[UMShareToWechatSession];
            [UMSocialData defaultData].extConfig.wechatSessionData.url = _wxUrl?_wxUrl:urlStr;
            [UMSocialData defaultData].extConfig.wechatSessionData.title = _wxContent?_wxContent:titleStr;
            break;
        }
        case ShareButtonTypeFriend:
        {
            // 朋友圈
            shareType = @[UMShareToWechatTimeline];
            [UMSocialData defaultData].extConfig.wechatTimelineData.url = urlStr;
            [UMSocialData defaultData].extConfig.wechatTimelineData.title = titleStr;
            break;
        }
        case ShareButtonTypeCancel:
        {
            break;
        }
        default:
            break;
    }
    
    [self postShareWith:shareType content:contentStr image:image urlImage:imageUrl];
}

@end
