//
//  ZYAiGuangViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYAiGuangViewController.h"
#import "ZYEngine.h"
#import "DataModels.h"
#import "UIButton+WebCache.h"
#import "SVPullToRefresh.h"
#import "ZYLeftViewController.h"
#import "ZYCenterViewController.h"
#import "ZYRightViewController.h"
#import "UIView+MBProgressHUD.h"

@interface ZYAiGuangViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UIView *   _titleView;
    UIView *   _lineView ;
    UIScrollView * _bigestScrollView;//最大的ScrollView
    NSMutableArray * _array;
    
}

@end

@implementation ZYAiGuangViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"===>加载页面1");
    NSLog(@"%@",NSHomeDirectory());
    
    
//    UIImageView * imageView =[[UIImageView alloc]initWithFrame:self.view.frame];
//    imageView.image=[UIImage  imageNamed:@"购星潮导视640-960.png"];
//    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^
     {
        self.tabBarController.tabBar.hidden=YES;
         //imageView.alpha=0.5;
         
     } completion:^(BOOL finished)
     {
         self.tabBarController.tabBar.hidden=NO;

         //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1];
         self.automaticallyAdjustsScrollViewInsets=NO;
         self.navigationController.navigationBar.hidden=YES;
         CGRect frame = CGRectMake(0.0, 0, 320, 64);
         _titleView = [[UIView alloc] initWithFrame:frame];
         [_titleView setBackgroundColor:[[UIColor alloc] initWithRed:253/255.0 green:151/255.0 blue:181/255.0 alpha:1]];
         [self.view addSubview:_titleView];
         
         [self creatTitleButton];
         [self creatBigScrollView];
         
         ZYCenterViewController * centerC =[[ZYCenterViewController alloc]init];
         ZYLeftViewController * leftC =[[ZYLeftViewController alloc]init];
         ZYRightViewController * right =[[ZYRightViewController alloc]init];
         centerC.AGControl=self;
         leftC.AGControl=self;
         right.AGControl=self;
         
         [self.view showActivityWithText:@"请稍等"];
         
         _array = [[NSMutableArray alloc]initWithObjects:leftC.view,centerC.view,right.view ,nil];
         
         for (int i=0; i<3; i++)
         {
             UIView * view =(UIView *)[_array objectAtIndex:i];
             
             view.frame=CGRectMake(i*self.view.frame.size.width, 0, 320, self.view.frame.size.height-64-50);
             [_bigestScrollView addSubview:view];
             
         }
    }];

}
-(void)creatBigScrollView
{
    _bigestScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-50-64)];
    
    NSLog(@"height----%f",self.view.frame.size.height);
    _bigestScrollView.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height-64-50);
    _bigestScrollView.backgroundColor=[[UIColor alloc]initWithRed:211/250.0 green:211/250.0 blue:211/250.0 alpha:1];
    _bigestScrollView.directionalLockEnabled=YES;
    _bigestScrollView.pagingEnabled=YES;
    _bigestScrollView.delegate=self;
    //_bigestScrollView.contentSize=CGSizeMake(320*3, self.view.frame.size.height-64);
    [self.view addSubview:_bigestScrollView];
    

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //改变button的字体颜色
    for (int i=0; i<3; i++) {
        UIButton * btn =(UIButton *)[self.view viewWithTag:i+1];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (btn.tag==scrollView.contentOffset.x/320.0+1) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            
            ;
            //获得button的title；
            NSString * title = btn.titleLabel.text ;
            CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:17]];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            _lineView.center = CGPointMake(btn.center.x,_lineView.center.y);
            _lineView.bounds = CGRectMake(0, 0,size.width , 2);
            [UIView commitAnimations];
        }
    }
    
}
//导航条button绑定的方法
-(void)buttonClick:(UIButton *)button
{
    //改变button的字体颜色
    for (int i=0; i<3; i++) {
        UIButton * btn =(UIButton *)[self.view viewWithTag:i+1];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (btn.tag==button.tag) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
    //获得button的title；
    NSString * title = button.titleLabel.text ;
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:17]];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    _lineView.center = CGPointMake(button.center.x,_lineView.center.y);
    _lineView.bounds = CGRectMake(0, 0,size.width , 2);
    [UIView commitAnimations];
    
    
    _bigestScrollView.contentOffset=CGPointMake(self.view.frame.size.width*(button.tag-1), 0);
 }

-(void)creatTitleButton
{
     NSArray * titleArray = [[NSArray alloc]initWithObjects:@"精选",@"团购",@"9块9", nil];
    for ( int i = 0 ; i<3; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(i*80+30, 20, 80, 35);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag=i+1;
        NSString * title = [titleArray objectAtIndex:i];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_titleView addSubview:btn];
        
        if (i == 0)
        {
            _lineView = [[UIView alloc]init];
            _lineView.backgroundColor = [UIColor redColor];
            //根据button上面的title计算宽度
            CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:17]];
            _lineView.bounds = CGRectMake(0, 0, size.width, 2);
            _lineView.center = CGPointMake(btn.center.x,62);
            [_titleView   addSubview:_lineView];
            
        }
        
    }

}



@end
