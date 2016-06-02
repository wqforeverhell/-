//
//  ZYLeftViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-4.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYLeftViewController.h"
#import "ZYEngine.h"
#import "DataModels.h"
#import "SVPullToRefresh.h"
#import "ZYPushViewController.h"
#import "ZYCustomBtton.h"
#import "ZYWebViewController.h"
#import "UIButton+WebCache.h"
#import "ZYAiGuangViewController.h"

//@class ZYAiGuangViewController;
@interface ZYLeftViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    //布局大的_scrollView：
    UIScrollView * _scrollView;
    NSMutableArray * _dataArray;
    UIPageControl * _pageControl;
    //NSMutableArray * _array;
    
    //布局小的_scrollView
    UIScrollView * _adScrollView;
    NSTimer * _timer;
    int speed;

    NSMutableArray * _indexArray;
    NSMutableArray * _showArray;
    float colHeight[2];
    
    int curentIndex;
}

@end

@implementation ZYLeftViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    speed=1;
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self creatScrollView];////创建大的scrollView
    [self creatSmallView];//创建小的scrollView
    
    [ZYEngine getAdMessage:^(NSMutableArray *array) {
        
        _dataArray=array;
        // [_dataArray addObjectsFromArray:array];
        [self adScrollView];
        //NSLog(@"====%@",_dataArray);
    }];

    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scrollPage) userInfo:nil repeats:YES];
    }
    
    //下拉刷新
    __weak ZYLeftViewController * lc =self;
    
    [_scrollView addPullToRefreshWithActionHandler:^{
        curentIndex = 0;
        [lc requestData];
    }];
    //上拉加载更多
    
    [_scrollView addInfiniteScrollingWithActionHandler:^{
        curentIndex ++;
        [lc requestData];
    }];
    
    //首次进入刷新状态
    [_scrollView triggerPullToRefresh];
    
    //创建表
    for (int i=0; i<2; i++)
    {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(7+157*i, 140, 150,_scrollView.frame.size.height-130) style:UITableViewStylePlain];
        
        tableView.scrollEnabled=NO;
        tableView.tag=i+1;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=[UIColor clearColor];
        [_scrollView addSubview:tableView];
        
    }
    _indexArray =[[NSMutableArray alloc]init];
    _indexArray[0] = [NSMutableArray array];
    _indexArray[1] = [NSMutableArray array];
    _showArray=[[NSMutableArray alloc]init];
    
    //[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(scrollViewDS) userInfo:nil repeats:YES];
}
//-(void)scrollViewDS
//{
//    [self scrollViewDidScroll:_scrollView];
//}
-(void)requestData
{
    [ZYEngine getTextMessage:curentIndex :^(NSMutableArray *array) {
        if (curentIndex == 0) {
            [_showArray removeAllObjects];
        }
        
        [_showArray addObjectsFromArray:array];
        [self reloadTableView];
        if (curentIndex == 0) {
            [_scrollView.pullToRefreshView stopAnimating];
        }else{
            [_scrollView.infiniteScrollingView stopAnimating];
        }
        
    }];
    
}

-(void)scrollPage
{
    _pageControl.currentPage+=speed;
    
    if (_pageControl.currentPage==_dataArray.count-1 || _pageControl.currentPage==0) {
        speed=-speed;
    }
    _adScrollView.contentOffset=CGPointMake(_pageControl.currentPage*320, 0);
    
}

//创建大的_scrollView
-(void)creatScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.tag = 10086;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
}
//创建小的_adScrollView
-(void)creatSmallView
{
      self.automaticallyAdjustsScrollViewInsets=NO;
    _adScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 130)];
    _adScrollView.delegate = self;
    _adScrollView.showsHorizontalScrollIndicator = NO;
    _adScrollView.pagingEnabled = YES;
    _adScrollView.directionalLockEnabled=YES;
    _adScrollView.tag = 10000;
    
    _adScrollView.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_adScrollView];
    
}
//小ScrollView
-(void)adScrollView
{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 110, 320, 30)];
    _pageControl.numberOfPages = _dataArray.count;
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [_scrollView addSubview:_pageControl];
    
    CGSize size = _adScrollView.frame.size;
    
    for (int i = 0; i< _dataArray.count; i++)
    {
        
        AdBanners * item = _dataArray[i];
        ZYCustomBtton * button = [ZYCustomBtton buttonWithType:UIButtonTypeCustom];
        button.item=item;

        button.frame = CGRectMake(i*size.width, 0, self.view.frame.size.width, size.height);
        //[button sd_setBackgroundImageWithURL:[NSURL URLWithString:item.bannerImgUrl] forState:UIControlStateNormal];
        [button setBackgroundImageWithURL:[NSURL URLWithString:item.bannerImgUrl]];
        [button addTarget:self action:@selector(adClick:) forControlEvents:UIControlEventTouchUpInside];
        _adScrollView.contentOffset = CGPointMake(_adScrollView.frame.size.width, 0);
        _adScrollView.contentSize = CGSizeMake(_adScrollView.frame.size.width*(_dataArray.count), 130);
        [_adScrollView addSubview:button];
    }
}

//点击小的scrollView绑定的事件：
-(void)adClick:(ZYCustomBtton*)button
{
    
    ZYWebViewController * webC=[[ZYWebViewController alloc]init];
    webC.url=button.item.bannerUrl;
    webC.hidesBottomBarWhenPushed=YES;
    [self.AGControl.navigationController pushViewController:webC animated:YES];
   
//    ZYWebViewController * vc =[[ZYWebViewController alloc]init];
//    vc.url=button.item.bannerUrl;
//    NSLog(@"====>>>%@",vc.url);
//    UIWindow * window =[UIApplication sharedApplication].keyWindow;
//    window.rootViewController=vc;
  
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
        DataList * good = _showArray[i];
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
        UITableView *tview = (UITableView *)[_scrollView viewWithTag:i+1];
        [tview reloadData];
        if (maxHeight <tview.contentSize.height) {
            maxHeight = tview.contentSize.height;
        }
    }
    _scrollView.contentSize=CGSizeMake(320, maxHeight);
    
    float y = _scrollView.contentOffset.y;
    if (y > 100) {
        [_scrollView setContentOffset:CGPointMake(0.0f, y-2) animated:YES];
        
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
        cell.backgroundColor=[UIColor clearColor];
        
        UIView * view =[[UIView alloc]init];
        view.backgroundColor=[UIColor whiteColor];
        view.tag=5;
        [cell addSubview:view];
        
        ZYCustomBtton * btn =[ZYCustomBtton buttonWithType:UIButtonTypeCustom];
        btn.tag=10;
        [cell addSubview:btn];
        
        UIButton * redBtn =[[UIButton alloc]init];
        redBtn.tag=111;
        [cell addSubview:redBtn];
        
        UILabel * detailLbl =[[UILabel alloc]init];
        detailLbl.tag=20;
        detailLbl.numberOfLines=0;
        detailLbl.font=[UIFont systemFontOfSize:11];
        [cell addSubview:detailLbl];
        
        UILabel * likeLib =[[UILabel alloc]init];
        likeLib.tag=21;
        likeLib.numberOfLines=0;
        likeLib.font=[UIFont systemFontOfSize:11];
        [cell addSubview:likeLib];

   }
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    DataList * list = _showArray[[number integerValue]];
    
    UIView * cellView = (UIView *)[cell viewWithTag:5];
    cellView.frame=CGRectMake(0, 0, 150, list.imgHeight+45);
    
    ZYCustomBtton * cellBtn = (ZYCustomBtton *)[cell viewWithTag:10];
    cellBtn.frame=CGRectMake(0, 0, 150, list.imgHeight);
    
    //[cellBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:list.picUrl] forState:UIControlStateNormal];
    [cellBtn setBackgroundImageWithURL:[NSURL URLWithString:list.picUrl]];
    [cellBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    cellBtn.datalist=list;
    
    //cellBtn.userInteractionEnabled=YES;

    UIButton * CellRedBtn = (UIButton *)[cell viewWithTag:111];
    CellRedBtn.frame=CGRectMake(80, list.imgHeight+10, 20,20);
    [CellRedBtn setBackgroundImage:[UIImage imageNamed:@"喜欢2"] forState:UIControlStateNormal];
    
    UILabel * cellLbl = (UILabel *)[cell viewWithTag:20];
    cellLbl.frame=CGRectMake(10, list.imgHeight+5,50, 30);
    cellLbl.text=[NSString stringWithFormat:@"￥%@",list.price];
    cellLbl.textColor=[UIColor redColor];
    
    UILabel * likeLib = (UILabel *)[cell viewWithTag:21];
    likeLib.frame=CGRectMake(110, list.imgHeight+5,50, 30);
    likeLib.text=[NSString stringWithFormat:@"%.0f",list.likeCount];

    
    if (tableView.tag==1&&indexPath.row==0)
    {
        cellLbl.text=@"";
        CellRedBtn.frame=CGRectZero;
        likeLib.text=@"";
        cellView.frame=CGRectMake(0, 0, 150, list.imgHeight+5);
    }

  return cell;
}
//点击button绑定事件
-(void)clickBtn:(ZYCustomBtton * )button
{
  
    NSLog(@"====>button绑定了");
    if ([button.datalist isEqual: _showArray[0]] ) {
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:@"对不起" message:@"没有找到相关商品" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;
    }

    ZYPushViewController * vc =[[ZYPushViewController alloc]init];
    vc.dataList=button.datalist;
    vc.hidesBottomBarWhenPushed=YES;
    [self.AGControl.navigationController pushViewController:vc animated:YES];
 
    
    //[self.aiGControl.navigationController pushViewController:vc animated:YES];
    
    // vc.dataList=list;
    //[self.navigationController pushViewController:vc animated:YES];
    //[self presentViewController:vc animated:YES completion:nil];
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    NSLog(@"====>button绑定了");
//    ZYPushViewController * vc =[[ZYPushViewController alloc]init];
//   // vc.dataList=list;
//    [self.navigationController pushViewController:vc animated:YES];
//    int index = tableView.tag == 1?0:1;
//    NSMutableArray *arr = _indexArray[index];
//    NSNumber *number = arr[indexPath.row];
//    DataList * list = _showArray[[number integerValue]];
//    
//    //[self.navigationController pushViewController:vc animated:YES];
//    
//    
//
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int index = tableView.tag == 1?0:1;
    NSMutableArray *arr = _indexArray[index];
    NSNumber *number = arr[indexPath.row];
    DataList * list = _showArray[[number integerValue]];
    
    if (tableView.tag==1&&indexPath.row==0) {
        
        return list.imgHeight+15;
    }
    
    return list.imgHeight+55.0f;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    float y = scrollView.contentOffset.y;
    if (y< 130)
    {
        for (UIView * view in scrollView.subviews)
        {
            
            if ([view isKindOfClass:[UITableView class]])
            {
                
                UITableView * tview =(UITableView *)view;
                tview.frame = CGRectMake(tview.frame.origin.x,140, tview.frame.size.width, tview.frame.size.height);
                
            }

    }

        
        
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
            float m = scrollView.contentOffset.y-130;
            tview.contentOffset = CGPointMake(0, m);
            
            //  tview.contentOffset= scrollView.contentOffset;
            tview.frame = CGRectMake(tview.frame.origin.x,y+10, tview.frame.size.width, tview.frame.size.height);
        }
    }
    
}
@end
