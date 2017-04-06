//
//  TestBEViewController.m
//  BEKit
//
//  Created by sundl1988@163.com on 04/06/2017.
//  Copyright (c) 2017 sundl1988@163.com. All rights reserved.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
