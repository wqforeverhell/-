//
//  ZYMineViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYMineViewController.h"
#import "MyCollectViewController.h"
#import "HelpAndFeedbackViewController.h"
#import "AboutUsViewController.h"
#import "SDImageCache.h"
@interface ZYMineViewController ()

@end

@implementation ZYMineViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1];
    
    
    //self.title=@"购星潮";
    [_tableView reloadData];
    UIView*titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    titleView.backgroundColor=[[UIColor alloc]initWithRed:252/250.0 green:151/250.0 blue:181/250.0 alpha:1];
    [self.view addSubview:titleView];
    
    UILabel*titleLabel=[[UILabel alloc]init];
    titleLabel.frame=CGRectMake(130, 12, 60, 40);
    titleLabel.text=@"购星潮";
    titleLabel.textColor=[UIColor redColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [titleView addSubview:titleLabel];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"===>加载页面3");
    
    
    UILabel*detailTitleLabel=[[UILabel alloc]init];
    detailTitleLabel.frame=CGRectMake(0, 64, 320, 50);
    detailTitleLabel.text=@"现在，你就是潮星";
    detailTitleLabel.textColor=[UIColor blackColor];
    detailTitleLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:detailTitleLabel];
    
    NSArray * nameArray1 = [[NSArray alloc]initWithObjects:@"主体颜色",@"版本信息", nil];
    NSArray * nameArray2 = [[NSArray alloc]initWithObjects:@"清理缓存",@"我的收藏", nil];
    NSArray * nameArray3 = [[NSArray alloc]initWithObjects:@"帮助与反馈",@"关于我们", nil];
     nameArray = [[NSArray alloc]initWithObjects:nameArray1,nameArray2,nameArray3 ,nil];
    
    NSArray * imgNameArray1 = [[NSArray alloc]initWithObjects:@"主题",@"版本信息", nil];
    NSArray * imgNameArray2 = [[NSArray alloc]initWithObjects:@"清理2",@"收藏2", nil];
    NSArray * imgNameArray3 = [[NSArray alloc]initWithObjects:@"帮助与反馈",@"关于我们", nil];
    imgNameArray = [[NSArray alloc]initWithObjects:imgNameArray1,imgNameArray2,imgNameArray3 ,nil];

    
    height=self.view.frame.size.height-50-64-50;
    NSLog(@"%f",self.view.frame.size.height);
    NSLog(@"----%f",height);;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64+50, 320, height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled=NO;
    _tableView.rowHeight=height/9;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return 2;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
        imgView.tag = 10001;
        [cell addSubview:imgView];
        
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 0, 100, 35)];
        nameLabel.tag = 10002;
        nameLabel.font = [UIFont systemFontOfSize:20];
        [cell addSubview:nameLabel];
        
        
        if (indexPath.section==0&&indexPath.row==0)
        {
            UILabel*colorLabel=[[UILabel alloc]init];
            colorLabel.frame=CGRectMake(260, 0, 60, 35);
            colorLabel.tag=10003;
            colorLabel.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:colorLabel];
        }
        if (indexPath.section==0&&indexPath.row==1)
        {
            UILabel*infoLabel=[[UILabel alloc]init];
            infoLabel.frame=CGRectMake(240, 0, 80, 35);
            infoLabel.tag=10004;
            infoLabel.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:infoLabel];
        }
        if (indexPath.section==1&&indexPath.row==0)
        {
            // 获取sdwebImage 缓存的图片大小
            
            SDImageCache *imageCache = [SDImageCache sharedImageCache];
            
            int size = [imageCache getSize];
            NSLog(@"size  %d",size);
            
            //cell.textLabel.text =[NSString stringWithFormat:@"清理图片缓存(%.2fM)",size/1024.0/1024.0];
            
            UILabel*clearLabel=[[UILabel alloc]init];
            clearLabel.frame=CGRectMake(260, 0, 60, 40);
            clearLabel.tag=10005;
            clearLabel.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:clearLabel];
        }

    }
    
     NSString * imgName = [[imgNameArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        NSString * name = [[nameArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        
        UIImageView * imgView = (UIImageView*)[cell viewWithTag:10001];
        imgView.image = [UIImage imageNamed:imgName];
        
        UILabel * nameLabel = (UILabel*)[cell viewWithTag:10002];
        nameLabel.text = name;
    
    
    UILabel * colorLabel = (UILabel*)[cell viewWithTag:10003];
    colorLabel.text=@"Pink";
    
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    // app版本
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
   
    UILabel * infoLabel = (UILabel*)[cell viewWithTag:10004];
    infoLabel.text=[NSString stringWithFormat:@"%@版本",app_Version];
    
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    int size = [imageCache getSize];
    NSLog(@"size  %d",size);
    
    UILabel * clearLabel = (UILabel*)[cell viewWithTag:10005];
    clearLabel.text=[NSString stringWithFormat:@"%.2fM",size/1024.0/1024.0];
    
    
    if((indexPath.section==1&&indexPath.row==1)||indexPath.section==2)
    {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return height/9;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }
    return height/9;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1&&indexPath.row==0)
    {
        
        SDImageCache *imageCache = [SDImageCache sharedImageCache];
        int size = [imageCache getSize];
        NSLog(@"size  %d",size);
        float currentSize=size/1024.0/1024.0;
        NSString*sizeString=[NSString stringWithFormat:@"共%.2fM缓存",currentSize];

        //删除本地缓存的图片文件
        [[SDImageCache sharedImageCache] clearDisk];
        //删除内存中缓存的图片对象
        [[SDImageCache sharedImageCache] clearMemory];
        [_tableView reloadData];
        UIAlertView*alertView=[[UIAlertView alloc]initWithTitle:sizeString message:@"已经全部清理" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
    if (indexPath.section==1&&indexPath.row==1)
    {
        MyCollectViewController*vc=[[MyCollectViewController alloc]init];
       // vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        //self.navigationController.navigationBarHidden=YES;
    }
    
    if (indexPath.section==2&&indexPath.row==0)
    {
        HelpAndFeedbackViewController*vc=[[HelpAndFeedbackViewController alloc]init];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.navigationController.navigationBarHidden=YES;
    }
    
    if (indexPath.section==2&&indexPath.row==1)
    {
        AboutUsViewController*vc=[[AboutUsViewController alloc]init];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.navigationController.navigationBarHidden=YES;
    }
}
@end
