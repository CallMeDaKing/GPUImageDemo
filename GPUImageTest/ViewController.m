//
//  ViewController.m
//  GPUImageTest
//
//  Created by new on 2020/8/21.
//  Copyright © 2020 SIBaiLai. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *iconImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *topButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    [topButton addTarget:self action:@selector(buttonClick)
        forControlEvents:UIControlEventTouchUpInside];
    [topButton setTitle:@"button" forState:UIControlStateNormal];
    [self.view addSubview:topButton];
    
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    self.iconImageView.image = [UIImage imageNamed:@"test_image"];
    [self.view addSubview:self.iconImageView];
    
    
}

- (void)buttonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self addFilter];
    }
    
}

- (void)addFilter {
    
    GPUImageSketchFilter *filter = [[GPUImageSketchFilter alloc] init];
    [filter forceProcessingAtSize:CGSizeMake(self.iconImageView.bounds.size.width, self.iconImageView.bounds.size.height)];
    [filter useNextFrameForImageCapture];
    
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:self.iconImageView.image];
    [picture addTarget:filter];
    // 开始渲染
    [picture processImage];
    
    // 获取渲染后的图片
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    [self.iconImageView setImage:newImage];
}


@end
