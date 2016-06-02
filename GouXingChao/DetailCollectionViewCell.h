//
//  CollectionViewCell.h
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCollectionViewCell : UICollectionViewCell
{
    UIImageView *imageView ;
    UILabel *priceLabel;
    UIImageView*likeImageView;
    UILabel*likeLabel;
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic ,strong) UIImageView*likeImageView;
@property (nonatomic,strong) UILabel *likeLabel;
@end
