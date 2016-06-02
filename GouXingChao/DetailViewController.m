//
//  DetailViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking.h"
#import "DetailCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "SVPullToRefresh.h"
#import "GoodsDetailViewController.h"

#define KCellIdentifier @"identifier"
#define CELL_WIDTH 150.0f
#define CELL_COLCount  2
@interface DetailViewController ()
   
@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    NSLog(@"===>加载页面3");
    
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:242/250.0 green:242/250.0 blue:242/250.0 alpha:1];
    self.title=[NSString stringWithFormat:@"%@",self.cateName];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor redColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];
    
    NSLog(@"%@",self.cateName);
    self.view.backgroundColor=[UIColor colorWithRed:212/250.0 green:212/250.0 blue:212/250.0 alpha:1];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem ;
    
    

    NSArray*titleArray=[NSArray arrayWithObjects:@"最新",@"销量",@"价格", nil];
    UISegmentedControl*segmentedContrl=[[UISegmentedControl alloc]initWithItems:titleArray];
    segmentedContrl.frame=CGRectMake(0, 64, 320, 30);
    
    segmentedContrl.tintColor=[UIColor grayColor];
    [segmentedContrl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged] ;
    segmentedContrl.selectedSegmentIndex=0;
    [self.view addSubview:segmentedContrl];
    
    
    // Do any additional setup after loading the view.
    UICollectionViewWaterfallLayout *layout =[[UICollectionViewWaterfallLayout alloc] init];
    layout.delegate = self;
    layout.itemWidth = CELL_WIDTH;
    layout.columnCount = CELL_COLCount;
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 94.0f, self.view.frame.size.width-10, self.view.frame.size.height) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[DetailCollectionViewCell class] forCellWithReuseIdentifier:KCellIdentifier];
    [self.view addSubview:collectionView];
    
    [self requestDetail];
    __weak DetailViewController *viewController = self;
    
    
    [collectionView addPullToRefreshWithActionHandler:^{
        currentIndex = 0;
        [baseClass.dataList removeAllObjects];
        [viewController requestDetail];
    }];
    
    [collectionView addInfiniteScrollingWithActionHandler:^{
        currentIndex ++;
        [viewController requestDetail];
    }];

 }
-(void)requestDetail
{
    
    NSArray*array=[NSArray arrayWithObjects:@"new", @"sales",@"priceUp",nil];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString*orderType=[array objectAtIndex:segSelectNum];
    NSString *url = [NSString stringWithFormat:@"http://service1.taotaosou.com/appItemList.do?cateId=%d&type=%d&orderType=%@&page=%d&userId=7044151",self.cateId,self.type,orderType,currentIndex];
    
    NSLog(@"%@",[array objectAtIndex:segSelectNum]);
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        DetailBaseClass * newClass = [DetailBaseClass modelObjectWithDictionary:responseObject];
       
        for (int i=0; i<newClass.dataList.count; i++)
        {
            DetailDataList*list=newClass.dataList[i];
            float width=list.imgWidth;
            float height=list.imgHeight;
            if (width==0||height==0)
            {
                [newClass.dataList removeObject:list];
            }
            
        }
        if (baseClass)
        {
            if (currentIndex==0)
            {
                [baseClass.dataList removeAllObjects];
            }
            [baseClass.dataList addObjectsFromArray:newClass.dataList];
        }else
        {
            baseClass = newClass;
        }
        [collectionView reloadData];
        [collectionView.pullToRefreshView stopAnimating];
        [collectionView.infiniteScrollingView stopAnimating];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    


}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailDataList *list = baseClass.dataList[indexPath.row];
    NSLog(@"您点击了%d ",indexPath.row);
    GoodsDetailViewController*vc=[[GoodsDetailViewController alloc]init];
    vc.dataList=list;
    [self.navigationController pushViewController:vc animated:YES];
//    vc.picUrl=list.picUrl;
//    vc.salesNum=list.salesNum;
//    vc.url=list.url;
//    vc.detailTitle=list.title;
//    vc.price=list.price;
    
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return baseClass.dataList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = KCellIdentifier;
    DetailCollectionViewCell * cell = (DetailCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DetailDataList *list = baseClass.dataList[indexPath.row];
    NSURL *url = [NSURL URLWithString:list.picUrl];
    [cell.imageView setImageWithURL:url];
    cell.likeImageView.image=[UIImage imageNamed:@"喜欢2"];
    cell.likeLabel.text=[NSString stringWithFormat:@"%0.f",list.likeCount];
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@",list.price];
    return cell;
}
#pragma mark - UICollectionViewDelegateWaterfallLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailDataList *list = baseClass.dataList[indexPath.row];
    float width = list.imgWidth;
    float height = list.imgHeight;
    if (height!=0)
    {
        height = height*CELL_WIDTH/width;

    }
    return height+44.0f;
    
}

-(void)segmentControlClick:(UISegmentedControl *)seg

{
    NSLog(@"选择器点击了");
    segSelectNum=seg.selectedSegmentIndex;
    currentIndex=0;
    [self requestDetail];
    [collectionView reloadData];
    //[collectionView.infiniteScrollingView stopAnimating];


}
-(void)leftItemClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
