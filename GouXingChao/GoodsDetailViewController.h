//
//  GoodsDetailViewController.h
//  GouXingChao
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 Mac. All rights reserved.
//
@class DetailDataList;
#import <UIKit/UIKit.h>
@interface GoodsDetailViewController : UIViewController

//
//@property(nonatomic,copy) NSString*detailTitle;
//@property(nonatomic,strong) NSString*picUrl;
//@property(nonatomic,strong)NSString*url;
//@property(nonatomic,assign) NSString*price;
//@property(nonatomic,assign) double salesNum;

@property (nonatomic,strong) DetailDataList * dataList;

@end
