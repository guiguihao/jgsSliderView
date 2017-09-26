//
//  ViewController.m
//  JGSsliderView
//
//  Created by jiangguishun1 on 2017/7/24.
//  Copyright © 2017年 jiangguishun1. All rights reserved.
//

#import "ViewController.h"
#import "jgsSliderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    jgsSliderView *jgsview = [[jgsSliderView alloc]initWithFrame:CGRectMake(100, 100, 200, 35)];
    [self.view addSubview:jgsview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
