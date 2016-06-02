//
//  ZYDLeftViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYDLeftViewController.h"
#import "CollectionViewCell.h"
#import "SVPullToRefresh.h"
#import "ZYEngine.h"
#import "UICollectionViewWaterfallLayout.h"
#import "DataModels.h"
#import "ZYBJViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "ZYDaPeiViewController.h"



#define KCellIdentifier @"identifier"
#define CELL_WIDTH 148.0f
#define CELL_COLCount 2
@interface ZYDLeftViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateWaterfallLayout>
{
    UICollectionView *collectionView;
    int currentIndex;
    NSMutableArray * _showArray;
}

@end

@implementation ZYDLeftViewController

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
    self.navigationController.navigationBarHidden=YES;
    NSLog(@"===>加载页面3");
    _showArray = [NSMutableArray array];
    self.view.backgroundColor=[UIColor clearColor];
    

    // Do any additional setup after loading the view.
    UICollectionViewWaterfallLayout *layout =[[UICollectionViewWaterfallLayout alloc] init];
    layout.delegate = self;
    layout.itemWidth = CELL_WIDTH;
    layout.columnCount = CELL_COLCount;
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(8.0f, 8.0f, self.view.frame.size.width-16, self.view.frame.size.height-64) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:KCellIdentifier];
    [self.view addSubview:collectionView];
    
    
    [self requestAd];
    
    
    __weak ZYDLeftViewController *viewController = self;
    [collectionView addPullToRefreshWithActionHandler:^{
        currentIndex = 0;
        [viewController requestAd];
    }];
    [collectionView addInfiniteScrollingWithActionHandler:^{
        currentIndex ++;
        [viewController requestAd];
    }];
    
    //首次进入刷新状态
    [collectionView triggerPullToRefresh];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)requestAd
{
    
//    [ZYEngine getDLeftTextMessage:currentIndex :^(NSMutableArray *array) {
//        if (currentIndex == 0) {
//            [_showArray removeAllObjects];
//        }
//        [_showArray addObjectsFromArray:array];
//           //NSLog(@"====>%@",_showArray);
//        [collectionView reloadData];
//        if (currentIndex == 0) {
//            [collectionView.pullToRefreshView stopAnimating];
//        }else{
//            [collectionView.infiniteScrollingView stopAnimating];
//        }
//        
//        
//    }];
    
    [ZYEngine getDLeftTextMessage:currentIndex withType:1 :^(NSMutableArray *array) {
        
        if (currentIndex == 0) {
            [_showArray removeAllObjects];
        }
        [_showArray addObjectsFromArray:array];
        //NSLog(@"====>%@",_showArray);
        [collectionView reloadData];
        if (currentIndex == 0) {
            [collectionView.pullToRefreshView stopAnimating];
        }else{
            [collectionView.infiniteScrollingView stopAnimating];
        }
    }];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DLImgGroups *list = _showArray[indexPath.row];
    NSLog(@"您点击了%d  %@",indexPath.row,list.focusName);
    
    ZYBJViewController * vc =[[ZYBJViewController alloc]init];
    vc.DLlist=list;
    vc.hidesBottomBarWhenPushed=YES;
    [self.DPControl.navigationController pushViewController:vc animated:YES];
    
//    UIWindow * window =[UIApplication sharedApplication].keyWindow;
//    window.rootViewController=vc;
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _showArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = KCellIdentifier;
    CollectionViewCell * cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DLImgGroups *list = _showArray[indexPath.row];
    //NSLog(@"====>>%@",list);
    NSURL *url = [NSURL URLWithString:list.imgUrl];
    //[cell.imageView sd_setImageWithURL:url];
    //[cell.placeButton  sd_setBackgroundImageWithURL:[NSURL URLWithString:list.focusHeadImgUrl] forState:UIControlStateNormal ];
       // NSLog(@"====++%f",list.dapeiCount);
    [cell.imageView setImageWithURL:url];
    [cell.placeButton setBackgroundImageWithURL:[NSURL URLWithString:list.focusHeadImgUrl] ];
    cell.countLabel.text=[NSString stringWithFormat:@"%.0f组商品",list.dapeiCount];
    cell.likeLabel.text=[NSString stringWithFormat:@"%.0f",list.likeCount];
    
    if ([cell.likeLabel.text isEqualToString:@"0"]) {
       cell.likeLabel.text=@"喜欢";
    }
    //cell.likeLabel.text=@"喜欢";

    cell.titleLabel.text = list.focusName;
    
    return cell;
}
#pragma mark - UICollectionViewDelegateWaterfallLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLImgGroups *list = _showArray[indexPath.row];
    float width = list.imgWidth;
    float height = list.imgHeight;
    height = height*CELL_WIDTH/width;
    return height+70.0f;
}
@end
