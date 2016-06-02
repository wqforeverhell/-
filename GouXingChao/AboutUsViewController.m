//
//  AboutUsViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView*backView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backView.image=[UIImage imageNamed:@"关于我们详情.png"];
    [self.view addSubview:backView];
    
    UIButton*backButton=[[UIButton alloc]init];
    backButton.frame=CGRectMake(20, self.view.frame.size.height-90, 280, 70);
    //backButton.backgroundColor=[UIColor blueColor];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back2"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}
-(void)goBack
{
    
    NSLog(@"click");
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
