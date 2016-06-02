//
//  MyCollectViewController.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "MyCollectViewController.h"
#import "MineCollectionViewCell.h"
#import "ZYEngine.h"
#import "UICollectionViewWaterfallLayout.h"
#import "DataModels.h"
#import "UIImageView+WebCache.h"
#import "ZYPushViewController.h"
#import "GoodsDetailViewController.h"
#import "DetailDataList.h"


#define KCellIdentifier @"identifier"
#define CELL_WIDTH 148.0f
#define CELL_COLCount 2


@interface MyCollectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateWaterfallLayout>

{
    UICollectionView *collectionView;
    int currentIndex;
    NSMutableArray * _showArray;
}

@end

@implementation MyCollectViewController

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
    self.navigationController.navigationBarHidden=NO;
   
    NSLog(@"===>加载页面3");
    self.view.backgroundColor=[[UIColor alloc]initWithRed:211/255.0 green:211/255.0 blue:211/255.0 alpha:1];

    self.title=@"我的最爱";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor redColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];

    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem ;
    
    _showArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    // Do any additional setup after loading the view.
    UICollectionViewWaterfallLayout *layout =[[UICollectionViewWaterfallLayout alloc] init];
    layout.delegate = self;
    layout.itemWidth = CELL_WIDTH;
    layout.columnCount = CELL_COLCount;
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(8.0f, 8.0f, self.view.frame.size.width-16, self.view.frame.size.height-50) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[MineCollectionViewCell class] forCellWithReuseIdentifier:KCellIdentifier];
    [self.view addSubview:collectionView];
    
}
-(void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{

    NSString * likeFilePath =[self getFilePath];
    NSData * likeData =[NSData dataWithContentsOfFile:likeFilePath];
    _showArray =[NSKeyedUnarchiver unarchiveObjectWithData:likeData];
   // NSLog(@"likeArray=====++>>>%@",likeArray);
    
   /*
    NSString * kindFilePath =[self getKindFilePath];
    NSData * kindData =[NSData dataWithContentsOfFile:kindFilePath];
    NSMutableArray *    kindArray =[NSKeyedUnarchiver unarchiveObjectWithData:kindData];
    NSLog(@"kindArray=====++>>>%@",kindArray);
    
    [_showArray addObjectsFromArray:likeArray];
    [_showArray addObjectsFromArray:kindArray];
     NSLog(@"_showArray=====>>>%@",_showArray);

    */
    [collectionView reloadData];

}

-(NSString *)getFilePath
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *directoryPath = [NSString stringWithFormat:@"%@/collect.plist",path];
    NSLog(@"----->%@",directoryPath);
    
    return directoryPath;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DataList *list = _showArray[indexPath.row];
        
    ZYPushViewController  * vc =[[ZYPushViewController alloc]init];
    vc.dataList=list;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _showArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = KCellIdentifier;
    MineCollectionViewCell * cell = (MineCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DataList *list = _showArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:list.picUrl];
    [cell.imageView setImageWithURL:url];
    cell.titleLabel.text=list.title;
    cell.priceLabel.text=[NSString stringWithFormat:@"￥ %@",list.price];
    cell.likeLabel.text=[NSString stringWithFormat:@"%.0f",list.likeCount];
   
//    cell.likeLabel.text=[NSString stringWithFormat:@"%.0f",list.likeCount];
//    
//    if ([cell.likeLabel.text isEqualToString:@"0"]) {
//        cell.likeLabel.text=@"喜欢";
//    }
    
   return cell;
}
#pragma mark - UICollectionViewDelegateWaterfallLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataList *list = _showArray[indexPath.row];
    float width = list.imgWidth;
    float height = list.imgHeight;
    height = height*CELL_WIDTH/width;
    return height+70.0f;
}
@end
