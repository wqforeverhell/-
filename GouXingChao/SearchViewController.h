//
//  SearchViewController.h
//  GouXingChao
//
//  Created by mac on 14-11-10.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "searchModel/SearchDataModels.h"
#import "DetailDataModels.h"
#import "UICollectionViewWaterfallLayout.h"
@interface SearchViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateWaterfallLayout>
{
    UICollectionView *collectionView;
     DetailBaseClass*baseClass;
    int currentIndex;
    NSMutableArray*dataArray;
    int segSelectNum;
}
@property NSString*keyWord;
@end
