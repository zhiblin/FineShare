//
//  FineShareManager.h
//  FineShareDemo
//
//  Created by xiaopi on 16/7/15.
//  Copyright © 2016年 fine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ShareView;
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define shareNameArray @[@"微信",@"朋友圈",@"新浪微博",@"QQ",@"QQ空间"]
#define shareImageArray @[@"w",@"f",@"b",@"QQ",@"Z"]

@interface FineShareManager : NSObject

// 分享视图背景
@property (nonatomic, strong) UIView *shareBgView;
// 分享视图
@property (nonatomic, strong) ShareView *shareView;



/**
 *  设置分享的AppKey，Appdelegate中执行一次即可。
 */
+ (void)setUMSocialAPPKey:(NSString *)key;
+ (void)WXAppid:(NSString *)appid appSecret:(NSString *)appSecret andUrl:(NSString *)url;
+ (void)QQAppid:(NSString *)appid appKey:(NSString *)appKey andUrl:(NSString *)url;
+ (void)SinaAppKey:(NSString *)appKey appSecret:(NSString *)appSecret andUrl:(NSString *)url;
/**
 *  单独设置新浪微博分享内容
 *
 *  @param title 分享内容
 */
- (void)setSinaTitle:(NSString *)title;

- (void)setSinaImage:(UIImage *)image;

- (void)setSinaUrl:(NSString *)url;

/**
 *  单独设置QQ平台分享内容
 *
 *  @param title 分享内容
 */
- (void)setQQTitle:(NSString *)title;

- (void)setQQImage:(UIImage *)image;

- (void)setQQUrl:(NSString *)url;

/**
 *  单独设置微信分享内容
 *
 *  @param title 分享内容
 */
- (void)setWXTitle:(NSString *)title;

- (void)setWXImage:(UIImage *)image;

- (void)setWXUrl:(NSString *)url;

/**
 *  需要分享的内容
 *
 *  @param vc      分享所在视图控制器
 *  @param content 分享的内容
 *  @param image   分享的图片
 *  @param url     分享的urlString
 */
- (void)setShareVC:(UIViewController *)vc content:(NSString *)content image:(UIImage *)image url:(NSString *)url;
/**
 *  可变头像分享内容
 *
 *  @param vc      分享所在视图控制器
 *  @param content 分享的内容
 *  @param image   分享的图片
 *  @param url     分享的urlString
 *  @param urlResource 图片url
 */
- (void)setFullShareVC:(UIViewController *)vc title:(NSString *)title content:(NSString *)content image:(UIImage *)image url:(NSString *)url urlResource:(NSString *)urlResource;

/**
 *  显示分享视图
 */
- (void)show;

/**
 *  隐藏分享视图
 */
- (void)hiddenShareView;

/**
 *  各个分享按钮点击事件
 *
 *  @param sender sender
 */
- (void)shareAction:(UIButton *)sender;


/**
 *  创建分享视图
 */
- (void)creatShareView;
@end
