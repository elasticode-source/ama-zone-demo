//
//  ViewController.m
//  ama-zone
//
//  Created by Tomer Shkolnik on 3/21/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Just showing an image here
    UIImage* img = [UIImage imageNamed:@"signUp"];
    UIImageView* imgV = [[UIImageView alloc] initWithImage:img];
    imgV.frame = self.view.frame;
    [self.view addSubview:imgV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
