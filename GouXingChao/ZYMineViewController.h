//
//  ZYMineViewController.h
//  GouXingChao
//
//  Created by Mac on 14-11-3.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYMineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * nameArray ;
    NSArray * imgNameArray ;
    UITableView*_tableView;
    float height;

}
@end
