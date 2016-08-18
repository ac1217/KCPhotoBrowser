//
//  ViewController.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "ViewController.h"
#import "KCPhotoSelection.h"
#import "HCQLogo.h"

@interface ViewController ()

@property (nonatomic, strong) HCQLogo *logo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.logo];
    
    self.logo.frame = CGRectMake(110, 110, 120, 120);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    KCPhotoSelection *selection = [KCPhotoSelection new];
    
    [self presentViewController:selection animated:YES completion:nil];
}

- (HCQLogo *)logo
{
    if (!_logo) {
        _logo = [HCQLogo new];
    }
    return _logo;
}

@end
