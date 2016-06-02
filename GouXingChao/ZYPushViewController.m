//
//  ZYPushViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYPushViewController.h"
#import "UIImageView+WebCache.h"
#import "ZYWebViewController.h"
#import "ZYCustomBtton.h"


@interface ZYPushViewController ()
{
    NSMutableArray * _likeArray;
}

@end

@implementation ZYPushViewController

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
    self.navigationController.navigationBar.hidden=NO;
    self.view.backgroundColor =[UIColor whiteColor];
    self.title=@"商品详情";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor redColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem ;
    
    
    NSLog(@"%@",self.dataList);
    float height =self.dataList.imgHeight*self.view.frame.size.width/self.dataList.imgWidth;
    height=250.0;
    UIImageView * imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, height-10)];
   // [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataList.picUrl]];
    imageView.userInteractionEnabled=YES;
    [imageView setImageWithURL:[NSURL URLWithString:self.dataList.picUrl]];
    [self.view addSubview:imageView];
    
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(0, height-65, 180, 45)];
    label.backgroundColor=[UIColor blackColor];
    label.alpha=0.5;
    label.font=[UIFont systemFontOfSize:20];
    label.text=[NSString stringWithFormat:@"  ￥ %@|     销量 %.0f",self.dataList.price,self.dataList.salesNum];
    label.textColor=[UIColor whiteColor];
    [imageView addSubview:label];
    
    
    ZYCustomBtton * likeBtn =[ZYCustomBtton buttonWithType:UIButtonTypeCustom];
    likeBtn.frame=CGRectMake(270, height-62, 40, 40);
    likeBtn.backgroundColor=[UIColor blackColor];
    likeBtn.alpha=0.8;
    likeBtn.layer.cornerRadius=8;
    NSString * filePath =[self getFilePath];
    NSData * oldData =[NSData dataWithContentsOfFile:filePath];
    _likeArray=[NSKeyedUnarchiver unarchiveObjectWithData:oldData];
    //NSLog(@"_likeArray--%@",_likeArray);
    if (_likeArray==nil)
    {
        NSLog(@"数组为空!!!!");
       [likeBtn setBackgroundImage:[UIImage imageNamed:@"喜欢1"] forState:UIControlStateNormal];
    }else
    {
        NSLog(@"==>%lu",(unsigned long)_likeArray.count);
        if (_likeArray.count ==0)
        {
            [likeBtn setBackgroundImage:[UIImage imageNamed:@"喜欢1"] forState:UIControlStateNormal];

        }else
        {
            for (DataList * list in _likeArray)
            {
                NSLog(@"list-->%@",list);
                if ([list.title isEqualToString:self.dataList.title])
                {
                    [likeBtn setBackgroundImage:[UIImage imageNamed:@"喜欢2"] forState:UIControlStateNormal];
                    likeBtn.selected=YES;
                    break;
                }
                
                [likeBtn setBackgroundImage:[UIImage imageNamed:@"喜欢1"] forState:UIControlStateNormal];
                
            }

        }
        
    }
    [likeBtn addTarget:self action:@selector(clickLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:likeBtn];
    
    
    UILabel * titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, height+64, self.view.frame.size.width-10, 60)];
    titleLabel.font=[UIFont systemFontOfSize:20];
    titleLabel.numberOfLines=0;
    titleLabel.text=[NSString stringWithFormat:@"%@",self.dataList.title];
    [self.view addSubview:titleLabel];
    
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(200, self.view.frame.size.height-100, 100, 30);
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"立即购买" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=8;
    [self.view addSubview:button];
    
    
}
-(NSString *)getFilePath
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *directoryPath = [NSString stringWithFormat:@"%@/collect.plist",path];
    NSLog(@"----->%@",directoryPath);
    
    return directoryPath;
}
//收藏按钮
-(void)clickLikeBtn:(ZYCustomBtton *)button
{
    if (button.selected==NO) {
        
        
        NSString * filePath =[self getFilePath];
        NSData * oldData =[NSData dataWithContentsOfFile:filePath];
        _likeArray=[NSKeyedUnarchiver unarchiveObjectWithData:oldData];
        //NSLog(@"_likeArray--%@",_likeArray);
        if (_likeArray==nil) {
            _likeArray =[[NSMutableArray alloc]initWithCapacity:0];
        }

        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
        [_likeArray addObject:self.dataList];
        //NSLog(@"_likeArray++%@",_likeArray);
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:_likeArray];
        [data writeToFile:filePath atomically:YES];
        
        
        [button setBackgroundImage:[UIImage imageNamed:@"喜欢2"] forState:UIControlStateNormal];
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"提示" message:@"成功收藏到文件中" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];

        
        
        button.selected=YES;
    }else
    {
        NSString * filePath =[self getFilePath];
        NSData * oldData =[NSData dataWithContentsOfFile:filePath];
        NSMutableArray * showArray=[NSKeyedUnarchiver unarchiveObjectWithData:oldData];
        NSLog(@"showArray++%@",showArray);
        for (DataList * list in showArray)
        {
            if ([list.title isEqualToString:self.dataList.title])
            {
                [showArray removeObject:list];
                break;
            }
            
        }
        NSLog(@"showArray--%@",showArray);

        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
        NSData * newData =[NSKeyedArchiver  archivedDataWithRootObject:showArray];
        [newData writeToFile:filePath atomically:YES];
        
        
        [button setBackgroundImage:[UIImage imageNamed:@"喜欢1"] forState:UIControlStateNormal];
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"删除收藏" message:@"已经从您的藏夹中删除" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];

        button.selected=NO;
    }
}
-(void)clickBtn
{
    ZYWebViewController * webC=[[ZYWebViewController alloc]init];
    webC.url=self.dataList.url;
    [self.navigationController pushViewController:webC animated:YES];
    
//    UIWebView *  webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.dataList.url]];
//    [self.view addSubview: webView];
//    [webView loadRequest:request];
//
    
}
-(void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
