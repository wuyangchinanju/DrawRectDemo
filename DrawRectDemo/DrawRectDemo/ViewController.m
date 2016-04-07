//
//  ViewController.m
//  DrawRectDemo
//
//  Created by 吴洋 on 16/4/5.
//  Copyright © 2016年 吴洋. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    
    [self.view addSubview:view];
}

@end
