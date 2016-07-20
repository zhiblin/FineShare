//
//  ViewController.m
//  FineShareDemo
//
//  Created by xiaopi on 16/7/15.
//  Copyright © 2016年 fine. All rights reserved.
//

#import "ViewController.h"
#import "FineShareManager.h"

@interface ViewController ()

   @property (nonatomic, strong) FineShareManager *fineShare;
@end

@implementation ViewController

-(FineShareManager *)fineShare{
    if (!_fineShare) {
        _fineShare = [[FineShareManager alloc] init];
    }
    return _fineShare;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)shareAction:(id)sender {
//    [self.fineShare setShareVC:self content:@"FineShare Demo" image:[UIImage imageNamed:@"demo.jpg"] url:@"https://github.com/zhiblin/FineShare"];
    [self.fineShare setFullShareVC:self content:@"test" image:[UIImage imageNamed:@"demo.jpg"] url:@"http://www.xiaopi.com" urlResource:@"http://www.xiaopi.com/game/uploadfile/2016/0412/20160412043255769.png"];
    [self.fineShare setSinaTitle:@"手机游戏就在@小皮游戏"];
    
    [self.fineShare show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
