//
//  HelpAndFeedbackViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "HelpAndFeedbackViewController.h"

@interface HelpAndFeedbackViewController ()

@end

@implementation HelpAndFeedbackViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView*backView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backView.image=[UIImage imageNamed:@"帮助与反馈详情.png"];
    [self.view addSubview:backView];
    
    UIButton*backButton=[[UIButton alloc]init];
    backButton.frame=CGRectMake(10, 30, 45, 42);
    //backButton.backgroundColor=[UIColor blueColor];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}
-(void)goBack
{
    
    NSLog(@"click");
    [self.navigationController popViewControllerAnimated:YES];

}

@end
