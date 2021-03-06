//
//  ViewController.m
//  KCPhotoBrowser
//
//  Created by zhangweiwei on 16/8/14.
//  Copyright © 2016年 Erica. All rights reserved.
//

#import "ViewController.h"
#import "KCPhotoSelection.h"

#import "KCPhotoBrowser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iv;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:sel/f.logo];
    
//    self.logo.frame = CGRectMake(110, 110, 120, 120);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    KCPhotoSelection *selection = [KCPhotoSelection new];
//    
//   /Users/Erica/Desktop/Other/123.m4a [self presentViewController:selection animated:YES completion:nil];
    
//    [[KSMediaTool sharedMediaTool] playMediaWithURL:[NSURL URLWithString:@"http://fs.android2.kugou.com/6194f6f01894d8dfe9cbef71bdc6019d/593e769d/G009/M0A/12/11/qYYBAFUNZi6IJELhAA0J3ey7Z8cAAA_4QIFTToADQn1306.m4a"]];
    
//    [[KSMediaTool sharedMediaTool] playMediaWithURL:[NSURL fileURLWithPath:@"/Users/Erica/Desktop/Other/123.m4a"]];
    
//    NSURL *remoteURL = [NSURL URLWithString:@"http://fs.android2.kugou.com/6194f6f01894d8dfe9cbef71bdc6019d/593e769d/G009/M0A/12/11/qYYBAFUNZi6IJELhAA0J3ey7Z8cAAA_4QIFTToADQn1306.m4a"];
//    
//    NSURL *localURL = [NSURL fileURLWithPath:@"/Users/Erica/Desktop/Other/123.m4a"];
//    
//    AVPlayer *player = [AVPlayer playerWithURL:localURL];
//    
//    [player play];
//    
//    self.player = player;
    
    
    NSMutableArray *arr = @[].mutableCopy;
    
    for (int i = 1; i < 9; i++) {
        [arr addObject:[KCPhoto photoWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"photo%zd", i]]]];
    }
    
    KCPhotoBrowser *browser = [[KCPhotoBrowser alloc] initWithPhotos:arr currentIndex:0 sourceImageViewBlock:^UIImageView *(NSInteger index) {
        return self.iv;
    }];
    
    
    
    [self presentViewController:browser animated:YES completion:nil];
    
   
    
}

@end
