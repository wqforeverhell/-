//
//  ZYCustomBtton.h
//  GouXingChao
//
//  Created by Mac on 14-11-4.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface ZYCustomBtton : UIButton
@property  NSString * picurl;
@property(nonatomic,strong)DataList * datalist;
@property(nonatomic,strong)AdBanners * item;

@property (nonatomic,assign)BOOL    isScelted;

@end
