//
//  ZYFenLeiViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//
#import "ZYFenLeiViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIButton+WebCache.h"
#import "CustomImageButton.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "UIView+MBProgressHUD.h"
@interface ZYFenLeiViewController ()

@end

@implementation ZYFenLeiViewController
@synthesize selectNum;

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    int height=self.view.frame.size.height-50-64;
    
    UITableView*leftTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 70, height)];
    leftTableView.backgroundColor=[UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    leftTableView.delegate=self;
    leftTableView.dataSource=self;
    leftTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    leftTableView.scrollEnabled = NO;
    [self.view addSubview:leftTableView];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"===>加载页面2");
    [self.view showActivityWithText:@"正在加载"];
    
    self.navigationController.navigationBarHidden=YES;
    UIView*titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    titleView.backgroundColor=[[UIColor alloc]initWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1];
    [self.view addSubview:titleView];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(5, 30, 250, 28)];
    searchBar.searchResultsButtonSelected=YES;
    searchBar.barTintColor=[[UIColor alloc]initWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1];
    //searchBar.showsCancelButton=YES;
    searchBar.layer.borderWidth=1;
    searchBar.layer.borderColor=[UIColor colorWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1].CGColor;
    searchBar.placeholder = @"寻找你喜欢的宝贝";
    searchBar.delegate=self;
    //searchBar.barTintColor=[UIColor redColor];
    //searchBar.tintColor=[UIColor redColor];
    [titleView addSubview:searchBar];
    
    UIButton*searchButton=[[UIButton alloc]init ];
    searchButton.backgroundColor=[UIColor redColor];
    searchButton.frame=CGRectMake(260, 30,50, 30);
    searchButton.layer.cornerRadius=5;
    [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [titleView addSubview:searchButton];
    
    
    AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManager manager];
    [manager GET:@"http://service1.taotaosou.com/getAppCategory.do" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //NSLog(@"JSON:%@",responseObject);
         model=[FenLeiBaseClass modelObjectWithDictionary:responseObject];
         _arrays=model.mobileCategory;
         
         [self.view hideActivity];
         int height=self.view.frame.size.height-114;
         
         UITableView*leftTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 70, height)];
         leftTableView.backgroundColor=[UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
         leftTableView.delegate=self;
         leftTableView.dataSource=self;
         leftTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
         leftTableView.scrollEnabled = NO;
         [self.view addSubview:leftTableView];
         
         
         scrollView=[[UIScrollView alloc]init];
         scrollView.frame=CGRectMake(70, 64, self.view.frame.size.width-70, height);
         scrollView.tag=100;
         
         scrollView.contentSize=CGSizeMake(250, 480);
         [self.view addSubview:scrollView];
         
         int n=0;
         MobileCategory * mobile =[_arrays objectAtIndex:0];
         
         for (int i=0;i<3 ; i++)
         {
             for (int j=0; j<mobile.sonCateList.count/3; j++)
             {
                 
                 SonCateList*sonCateList=[mobile.sonCateList objectAtIndex:n];
                 imageButton=[CustomImageButton buttonWithType:UIButtonTypeCustom];
                 
                 UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(5+86*i, 86+96*j, 66, 20)];
                 label.text=sonCateList.cateName;
                 label.font=[UIFont systemFontOfSize:9];
                 label.textAlignment=NSTextAlignmentCenter;
                 [scrollView addSubview:label];
                 
                 
                 imageButton.frame=CGRectMake(5+86*i, 20+96*j, 66, 66);
                 NSURL*url=[NSURL URLWithString:sonCateList.picUrl];
                 [imageButton setBackgroundImageWithURL:url];
                 
                 imageButton.cateId=sonCateList.sonCateListIdentifier;
                 imageButton.type=sonCateList.type;
                 imageButton.cateName=sonCateList.cateName;
                 
                 [imageButton addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];
                 [scrollView addSubview:imageButton];
                 
                 n++;
             }
         }
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error:%@",error);
     }];
    
    
    
}

#pragma park--
#pragma UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_arrays count];
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    MobileCategory * mobile =[_arrays objectAtIndex:indexPath.row];
    NSString * cateName=mobile.cateName;
    cell.textLabel.text=cateName;
    cell.backgroundColor=[UIColor clearColor];
    if (selectNum==indexPath.row)
    {
        cell.textLabel.textColor=[UIColor redColor];
        cell.textLabel.font=[UIFont systemFontOfSize:20];
    }else
    {
        cell.textLabel.textColor=[UIColor blackColor];
        cell.textLabel.font=[UIFont systemFontOfSize:17];
        
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectNum=indexPath.row;
    [tableView reloadData];
    
    if (scrollView.tag==100)
    {
        [scrollView removeFromSuperview];
    }
    
    int height=self.view.frame.size.height-114;
    scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(70, 64, self.view.frame.size.width-70, height);
    scrollView.userInteractionEnabled=YES;
    scrollView.tag=100;
    
    scrollView.contentSize=CGSizeMake(250, 480);
    [self.view addSubview:scrollView];
    
    int n=0;
    MobileCategory * mobile =[_arrays objectAtIndex:indexPath.row];
    
    for (int i=0;i<3 ; i++)
    {
        for (int j=0; j<mobile.sonCateList.count/3; j++)
        {
            
            SonCateList*sonCateList=[mobile.sonCateList objectAtIndex:n];
            
            imageButton=[CustomImageButton buttonWithType:UIButtonTypeCustom];
            imageButton.frame=CGRectMake(5+86*i, 20+96*j, 66, 66);
            NSURL*url=[NSURL URLWithString:sonCateList.picUrl];
            [imageButton setBackgroundImageWithURL:url];
            
            imageButton.cateId=sonCateList.sonCateListIdentifier;
            imageButton.type=sonCateList.type;
            imageButton.cateName=sonCateList.cateName;
            
            [imageButton addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:imageButton];
            
            UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(5+86*i, 86+96*j, 66, 20)];
            label.text=sonCateList.cateName;
            label.font=[UIFont systemFontOfSize:9];
            label.textAlignment=NSTextAlignmentCenter;
            [scrollView addSubview:label];
            
            n++;
        }
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(void)detail:(CustomImageButton*)btn
{
    CustomImageButton*button=btn;
    DetailViewController*vc=[[DetailViewController alloc]init];
    vc.cateId=button.cateId;
    vc.type=button.type;
    vc.cateName=button.cateName;
    vc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)searchButtonClicked
{
    NSLog(@"%@",searchBar.text);
    SearchViewController*vc=[[SearchViewController alloc]init];
    vc.keyWord=searchBar.text;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    backView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height-64)];
    backView.backgroundColor=[UIColor blackColor];
    backView.alpha=0.5;
    [self.view addSubview:backView];
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [backView removeFromSuperview];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

@end
