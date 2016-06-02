//
//  ZYWebViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYWebViewController.h"
#import "UIView+MBProgressHUD.h"

@interface ZYWebViewController ()

@end

@implementation ZYWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor =[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"商品详情";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor redColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];

    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem ;
    
    UIWebView *  webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -50, 320, self.view.frame.size.height+50)];
    webView.scrollView.bounces=NO;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
