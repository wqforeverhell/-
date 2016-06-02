//
//  DetailViewController.h
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailDataModels.h"
#import "UICollectionViewWaterfallLayout.h"
@interface DetailViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateWaterfallLayout>
{
    UICollectionView *collectionView;
    DetailBaseClass *baseClass;
    int currentIndex;
    NSMutableArray*dataArray;
    int segSelectNum;
}

@property int cateId;
@property int type;
@property NSString*cateName;
@end
