//
//  TestBEViewController.m
//  BEKit
//
//  Created by 孙丹龙 on 04/08/2016.
//  Copyright (c) 2016 孙丹龙. All rights reserved.
//

#import "TestBEViewController.h"
#import <BEKit/BEKit.h>

@interface TestBEViewController ()

@end

@implementation TestBEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", [UIDevice be_devicePlatform]);
    NSLog(@"%@", [UIDevice be_HWModel]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
