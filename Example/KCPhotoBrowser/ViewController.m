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

@interface ViewController ()<KCPhotoBrowserDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *iv;

@property (nonatomic,strong) NSArray *arr;

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
        [arr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"photo%zd", i]]];
    }
    
    self.arr = arr;
    
    KCPhotoBrowser *browser = [[KCPhotoBrowser alloc] initWithCurrentIndex:0];
    browser.dataSource = self;
    
//    KCPhotoBrowser *browser = [[KCPhotoBrowser alloc] initWithPhotos:arr currentIndex:0 sourceImageViewBlock:^UIImageView *(NSInteger index) {
//        return self.iv;
//    }];
    
    [self presentViewController:browser animated:YES completion:nil];
    
}

#pragma mark -KCPhotoBrowserDataSource
- (NSInteger)numberOfImagesInPhotoBrowser:(KCPhotoBrowser *)photoBrowser
{
    return self.arr.count;
}

- (id)photoBrowser:(KCPhotoBrowser *)photoBrowser imageResourceAtIndex:(NSInteger)index
{
    return self.arr[index];
}

- (UIImage *)photoBrowser:(KCPhotoBrowser *)photoBrowser placeholderImageAtIndex:(NSInteger)index
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"photo%zd", index + 1]];
}

- (UIImageView *)photoBrowser:(KCPhotoBrowser *)photoBrowser sourceImageViewAtIndex:(NSInteger)index
{
    return self.iv;
}

@end
