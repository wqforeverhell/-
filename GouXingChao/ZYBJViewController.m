//
//  ZYBJViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYBJViewController.h"
#import "ZYEngine.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "ZYBJTableViewCell.h"
#import "ZYWebViewController.h"


@interface ZYBJViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _showArray;
    UIImageView    *   _imageView;
    UIScrollView   * _scrollView;
    UITableView    * _tableView ;
    UIView  *    view;
    NSArray * _smallArray;
    NSArray * _array;
    NSTimer * _timer;
}

@end

@implementation ZYBJViewController
-(void)dealloc
{
    [_timer invalidate];
    _timer=nil;
}

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
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=NO;
    self.title=@"搭配详情";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor redColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];


    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem ;
    
        [self creatScrollView];
        
        _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320)];
        //[_imageView sd_setImageWithURL:[NSURL URLWithString:self.DLlist.imgUrl]];
        [_imageView setImageWithURL:[NSURL URLWithString:self.DLlist.imgUrl]];
        [_scrollView addSubview:_imageView];
        [self creatView];
        
        UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(8, _imageView.frame.origin.y+_imageView.frame.size.height+10, 45, 45)];
        //[button sd_setBackgroundImageWithURL:[NSURL URLWithString:self.DLlist.focusHeadImgUrl] forState:UIControlStateNormal];
        [button setBackgroundImageWithURL:[NSURL URLWithString:self.DLlist.focusHeadImgUrl]];
        button.layer.cornerRadius=22.5;
        button.clipsToBounds=YES;
        
        [_scrollView addSubview:button];
        
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(8+button.frame.size.width+10, button.frame.origin.y+5, 150, 30 )];
        label.text=self.DLlist.focusName;
        [_scrollView addSubview:label];
        
       // NSLog(@"+++++%f",self.DLlist.groupId);
        [ZYEngine getBJTextMessage:self.DLlist.groupId withType:1 :^(NSMutableArray *array) {
            
            _showArray =array;
            [self creatButton];
           // NSLog(@"===++%lu",(unsigned long)_showArray.count);
            
            
            [_tableView reloadData];
            
          _timer= [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(reloadData) userInfo:nil repeats:YES];
            [_timer fire];
            
        }];
        
}
//不断刷新下方列表
-(void)reloadData
{
    [_tableView reloadData];
    
}
-(void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)creatView
{
    
    view =[[UIView alloc]initWithFrame:CGRectMake(8, _imageView.frame.size.height+80, self.view.frame.size.width-15, 300 )];
    view.layer.cornerRadius=8;
    view.backgroundColor=[UIColor grayColor];
    view.alpha=0.5;
    [_scrollView addSubview:view];
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(8, 5, 20, 20);
    button.backgroundColor=[UIColor clearColor];
    [button setBackgroundImage:[UIImage imageNamed:@"配件架"] forState:UIControlStateNormal];
    [view addSubview:button];
    
}
-(void)creatScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-15)];
    
    NSLog(@"-----%f",self.view.frame.size.height);
    _scrollView.delegate = self;
    //_scrollView.backgroundColor=[UIColor redColor];
    _scrollView.tag = 10;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.directionalLockEnabled=YES;
    _scrollView.contentSize=CGSizeMake(320, 650);

    [self.view addSubview:_scrollView];
 
}
-(void)creatButton
{
    
    DHImgs * img =_showArray[0];
    _array =img.thumImgs;
    for (int i=0; i<_array.count; i++)
    {
        DHThumImgs * thumImg =_array[i];
        UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(70*i+15, _imageView.frame.size.height+120, 60, 60 );
        button.tag=i+1;
        button.layer.cornerRadius=8;
        button.clipsToBounds=YES;
        button.layer.borderWidth=2;
        button.layer.borderColor=[UIColor clearColor].CGColor;

//        button.bounds=CGRectMake(0, 0, 60, 60);
//        button.center=CGPointMake(70*i+50, view.center.y+3);
        button.tag=i+1;
        [button addTarget:self action:@selector(clickToBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImageWithURL:[NSURL URLWithString:thumImg.thumImgUrl]];
        //button.alpha=0.8;
        [_scrollView addSubview:button];
        
        if (i==0)
        {
            _smallArray=thumImg.products;
            button.layer.borderColor=[UIColor redColor].CGColor;
        }
    }
    
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(40, 3, 150, 20)];
    label.text=[NSString stringWithFormat:@"%d件图中商品同款",_array.count];
    label.textColor=[UIColor redColor];
    [view addSubview:label];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(10, 520, 300, 150 )];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_scrollView addSubview:_tableView];
    
}
-(void)clickToBtn:(UIButton*)btn
{
    for (int i=0; i<_array.count; i++)
    {
        UIButton * button =(UIButton*)[self.view viewWithTag:i+1];
        button.layer.borderColor=[UIColor clearColor ].CGColor;
        if ((i+1)==btn.tag)
        {
            button.layer.borderColor=[UIColor redColor ].CGColor;

        }
    }
    
    DHImgs * img =_showArray[0];
    NSArray * array =img.thumImgs;
    DHThumImgs * thumImg =array[btn.tag-1];
    _smallArray=thumImg.products;
    
    [_tableView reloadData];
    

}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return   _smallArray.count;
   // NSLog(@"+++>>%d",_smallArray.count);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYBJTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell =[[ZYBJTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    DHProducts * products =_smallArray[indexPath.row];
    [cell.imageView setImageWithURL:[NSURL URLWithString:products.productImgUrl]];
    cell.nameLabel.text=products.name;
    cell.prictLabel.text=[NSString stringWithFormat:@"￥%@",products.price];
   // NSLog(@"+++++<<<<%f",products.sellCount);
    cell.numLabel.text=[NSString stringWithFormat:@"销量%.0f",products.sellCount];
    cell.likeLabel.text=[NSString stringWithFormat:@"%.0f",products.likeStatus];
    [cell.likeButton setBackgroundImage:[UIImage imageNamed:@"喜欢2"] forState:UIControlStateNormal];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHProducts * products =_smallArray[indexPath.row];
    
//    UIWebView *  webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:products.productUrl]];
//    [self.view addSubview: webView];
//    [webView loadRequest:request];
    
    
    ZYWebViewController * webC=[[ZYWebViewController alloc]init];
    webC.url=products.productUrl;
    [self.navigationController pushViewController:webC animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

@end
