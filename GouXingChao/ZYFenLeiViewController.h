//
//  ZYFenLeiViewController.h
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FenLeiDataModels.h"
#import "CustomImageButton.h"
@interface ZYFenLeiViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

{
    NSArray*_arrays;
    
    FenLeiBaseClass*model;
    
    NSArray *_sonCateList;
    UIScrollView*scrollView;
    CustomImageButton*imageButton;
    UISearchBar *searchBar;
    UIView*  backView;
}
@property int selectNum;
@end


