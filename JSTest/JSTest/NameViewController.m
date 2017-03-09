//
//  NameViewController.m
//  JSTest
//
//  Created by iermu-xiaoqi.zhang on 2017/3/9.
//  Copyright © 2017年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()

@end

@implementation NameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.title = _name;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
