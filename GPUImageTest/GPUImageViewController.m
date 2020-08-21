//
//  GPUImageViewController.m
//  GPUImageTest
//
//  Created by new on 2020/8/21.
//  Copyright © 2020 SIBaiLai. All rights reserved.
//

#import "GPUImageViewController.h"
#import "GPUImage.h"
@interface GPUImageViewController ()
@property (nonatomic, strong) UIImageView *iconImageView;
@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.iconImageView.image = [UIImage imageNamed:@"test_image"];
    [self.view addSubview:self.iconImageView];
    
}


@end
