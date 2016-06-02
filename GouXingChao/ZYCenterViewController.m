//
//  ZYCenterViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-4.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYCenterViewController.h"
#import "SVPullToRefresh.h"
#import "ZYEngine.h"
#import "DataModels.h"
#import "ZYCustomBtton.h"
#import "ZYWebViewController.h"
#import "UIButton+WebCache.h"
#import "ZYAiGuangViewController.h"
#import "ZYWebViewController.h"



@interface ZYCenterViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * _bigScrollView;
    
    NSMutableArray * _indexArray;
    NSMutableArray * _showArray;
    float colHeight[2];
    
    int curentIndex;
    
}

@end

@implementation ZYCenterViewController

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
    [self creatScrollView];
    
    ZYCenterViewController * centerC =self;
    [_bigScrollView addPullToRefreshWithActionHandler:^{
        curentIndex = 0;
        [centerC requestData];
    }];
    //上拉加载更多
    
    [_bigScrollView addInfiniteScrollingWithActionHandler:^{
        curentIndex ++;
        [centerC requestData];
    }];
    
    //首次进入刷新状态
    [_bigScrollView triggerPullToRefresh];
    //创建表
    
    
    //创建表
    for (int i=0; i<2; i++)
    {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(7+157*i, 10, 150,_bigScrollView.frame.size.height-10) style:UITableViewStylePlain];
        
        tableView.scrollEnabled=NO;
        tableView.tag=i+1;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=[UIColor clearColor];
        [_bigScrollView addSubview:tableView];
        
    }
    
    _indexArray =[[NSMutableArray alloc]init];
    _indexArray[0] = [NSMutableArray array];
    _indexArray[1] = [NSMutableArray array];
    _showArray=[[NSMutableArray alloc]init];
    
}

-(void)creatScrollView
{
    _bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    _bigScrollView.delegate = self;
    _bigScrollView.backgroundColor=[UIColor clearColor];
    _bigScrollView.tag = 10086;
    _bigScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_bigScrollView];
    
}
-(void)requestData
{
    [ZYEngine getCenterTextMessage:curentIndex :^(NSMutableArray *array) {
        if (curentIndex == 0) {
            [_showArray removeAllObjects];
        }
        
        [_showArray addObjectsFromArray:array];
        [self reloadTableView];
        
        if (curentIndex == 0) {
            [_bigScrollView.pullToRefreshView stopAnimating];
        }else{
            [_bigScrollView.infiniteScrollingView stopAnimating];
        }
        
    }];
    
}
-(void)reloadTableView
{
    //计算高度的
    if (curentIndex == 0) {
        colHeight[0]=0.0;
        colHeight[1]=0.0;
        _indexArray[0] = [NSMutableArray array];
        _indexArray[1] = [NSMutableArray array];
    }
    
    int startIndex = 0 ;
    for (NSMutableArray *arr in _indexArray) {
        startIndex += arr.count;
    }
    
    for (int i= startIndex; i<_showArray.count; i++)
    {
        DSDataList * good = _showArray[i];
        float height = good.imgHeight;
        float width = good.imgWidth ;
        if(width!=0)
        {
            height = height*150/width;
        }
        
        width=150.0;
        //三位运算符
        good.imgHeight=height;
        good.imgWidth =width;
        
        int index = colHeight[0]<=colHeight[1]?0:1;
        
        float currentHeight = colHeight[index];
        [_indexArray[index] addObject:[NSNumber numberWithInt:i]];
        
        currentHeight +=(good.imgHeight+60);
        colHeight[index]=currentHeight;
    }
    
    float maxHeight = 0.0f;
    for (int i = 0; i < 2 ; i++) {
        UITableView *tview = (UITableView *)[_bigScrollView viewWithTag:i+1];
        [tview reloadData];
        if (maxHeight <tview.contentSize.height) {
            maxHeight = tview.contentSize.height;
        }
    }
    _bigScrollView.contentSize=CGSizeMake(320, maxHeight);
    
    
    
    float y = _bigScrollView.contentOffset.y;
    if (y > 100) {
        [_bigScrollView setContentOffset:CGPointMake(0.0f, y-2) animated:YES];
        
    }
}

#pragma mark tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    
    return arr.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell==nil)
    {
        NSLog(@"alloc ---%ld",(long)indexPath.row);
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.backgroundColor=[UIColor clearColor ];
        
        UIView * view =[[UIView alloc]init];
        view.backgroundColor=[UIColor whiteColor];
        view.tag=5;
        [cell addSubview:view];
        
        UIView * lineView =[[UIView alloc]init];
        lineView.backgroundColor=[UIColor blackColor];
        lineView.tag=6;
        [cell addSubview:lineView];

        
        ZYCustomBtton * btn =[ZYCustomBtton buttonWithType:UIButtonTypeCustom];
        btn.tag=10;
        [cell addSubview:btn];
        
        
        UILabel * detailLbl =[[UILabel alloc]init];
        detailLbl.tag=20;
        detailLbl.numberOfLines=0;
        detailLbl.font=[UIFont systemFontOfSize:11];
        [cell addSubview:detailLbl];
        
        UIButton * redBtn =[[UIButton alloc]init];
        redBtn.tag=111;
        [cell addSubview:redBtn];
        
        
        
        UILabel * likeLib =[[UILabel alloc]init];
        likeLib.tag=21;
        likeLib.numberOfLines=0;
        likeLib.font=[UIFont systemFontOfSize:11];
        [cell addSubview:likeLib];
        
        UILabel * titleLable =[[UILabel alloc]init];
        titleLable.tag=22;
        titleLable.numberOfLines=0;
        titleLable.font=[UIFont systemFontOfSize:10];
        [cell addSubview:titleLable];
        
        UILabel * countLabel =[[UILabel alloc]init];
        countLabel.tag=23;
        countLabel.numberOfLines=0;
        countLabel.font=[UIFont systemFontOfSize:10];
        [cell addSubview:countLabel];

        UILabel * timeLabel =[[UILabel alloc]init];
        timeLabel.tag=24;
        timeLabel.numberOfLines=0;
        timeLabel.font=[UIFont systemFontOfSize:10];
        [cell addSubview:timeLabel];
        
        UILabel * priceLabel =[[UILabel alloc]init];
        priceLabel.tag=25;
        priceLabel.numberOfLines=0;
        priceLabel.font=[UIFont systemFontOfSize:9];
        [cell addSubview:priceLabel];
        
        UIView * priceLine =[[UIView alloc]init];
        priceLine.backgroundColor=[UIColor grayColor];
        priceLine.tag=26;
        [cell addSubview:priceLine];
        


        
        
    }
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    DSDataList * list = _showArray[[number integerValue]];
    
    UIView * cellView = (UIView *)[cell viewWithTag:5];
    cellView.frame=CGRectMake(0, 0, 150, list.imgHeight+65);
    
    UIView * lineView = (UIView *)[cell viewWithTag:6];
    lineView.frame=CGRectMake(5, list.imgHeight+40, 150, 1);
    
    ZYCustomBtton * cellBtn = (ZYCustomBtton *)[cell viewWithTag:10];
    cellBtn.frame=CGRectMake(0, 0, 150, list.imgHeight);
    //[cellBtn setBackgroundImageWithURL:[NSURL URLWithString:list.picUrl]];
    //[cellBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:list.picUrl] forState:UIControlStateNormal];
    [cellBtn setBackgroundImageWithURL:[NSURL URLWithString:list.picUrl]];
    
    cellBtn.picurl=list.url;
    [cellBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * CellRedBtn = (UIButton *)[cell viewWithTag:111];
    CellRedBtn.frame=CGRectMake(80, list.imgHeight+20, 20,20);
    [CellRedBtn setBackgroundImage:[UIImage imageNamed:@"喜欢2"] forState:UIControlStateNormal];
    
    UILabel * cellLbl = (UILabel *)[cell viewWithTag:20];
    cellLbl.frame=CGRectMake(10, list.imgHeight+15,50, 30);
    cellLbl.text=[NSString stringWithFormat:@"￥%@",list.promoPrice];
    cellLbl.textColor=[UIColor redColor];
    
    UILabel * likeLib = (UILabel *)[cell viewWithTag:21];
    likeLib.frame=CGRectMake(107, list.imgHeight+20,40, 18);
    likeLib.layer.borderColor=[UIColor redColor].CGColor;
    likeLib.layer.borderWidth=1.0;
    likeLib.textAlignment=NSTextAlignmentCenter;
    likeLib.text=[NSString stringWithFormat:@"%@ 折",list.zhekou];
    likeLib.textColor=[UIColor redColor];
    
    UILabel * titleLable = (UILabel *)[cell viewWithTag:22];
    titleLable.frame=CGRectMake(5, list.imgHeight,150, 20);
    titleLable.text=[NSString stringWithFormat:@"%@",list.title1];
    
    UILabel * countLabel = (UILabel *)[cell viewWithTag:23];
    countLabel.frame=CGRectMake(90, list.imgHeight+45,80, 20);
    countLabel.text=[NSString stringWithFormat:@"%.0f 人参加",list.joinNum];

    UILabel * timeLabel = (UILabel *)[cell viewWithTag:24];
    timeLabel.frame=CGRectMake(5, list.imgHeight+45,100, 20);
    timeLabel.text=[NSString stringWithFormat:@"%@",list.lastTime];
    timeLabel.textColor=[UIColor grayColor];
    if (list.lastTime==nil) {
        timeLabel.text=@"";
    }
    
    UILabel * priceLabel = (UILabel *)[cell viewWithTag:25];
    priceLabel.frame=CGRectMake(45, list.imgHeight+22,30, 20);
    priceLabel.text=[NSString stringWithFormat:@"￥%@",list.price];
    priceLabel.textColor=[UIColor grayColor];
    
    UIView * priceLine = (UIView *)[cell viewWithTag:26];
    priceLine.frame=CGRectMake(42, list.imgHeight+32, 30, 1);
    
    //UILabel * cellLbl = (UILabel *)[cell viewWithTag:20];
    //cellLbl.frame=CGRectMake(0, [list.height floatValue]+5,150, 30);
    // cellLbl.text=list.goodName;
    
    return cell;
}
//点击按钮绑定的方法
-(void)clickBtn:(ZYCustomBtton*)btn
{
    ZYWebViewController * webC=[[ZYWebViewController alloc]init];
    webC.url=btn.picurl;
    webC.hidesBottomBarWhenPushed=YES;
    [self.AGControl.navigationController pushViewController:webC animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    DSDataList * list = _showArray[[number integerValue]];
    
    return list.imgHeight+80.0f;
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    float y = scrollView.contentOffset.y;
    if (y< 0) {
        return;
    }
    //    NSLog(@"%f",y);
    
    for (UIView * view in scrollView.subviews)
    {
        if ([view isKindOfClass:[UITableView class]])
        {
            UITableView * tview =(UITableView *)view;
            //判断最多拉到下边的高度
            float maxHeight =tview.contentSize.height-tview.frame.size.height;
            if (y>= (maxHeight))
            {
                continue;
            }
            float m = scrollView.contentOffset.y;
            tview.contentOffset = CGPointMake(0, m);
            
            //  tview.contentOffset= scrollView.contentOffset;
            tview.frame = CGRectMake(tview.frame.origin.x,y+10, tview.frame.size.width, tview.frame.size.height);
            
            
        }
    }
    
}


@end
