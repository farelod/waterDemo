//
//  ViewController.m
//  waterDemo
//
//  Created by mac on 15-3-6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "water.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    water *wat = [[water alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:wat];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
