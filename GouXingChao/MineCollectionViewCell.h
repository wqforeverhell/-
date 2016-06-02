//
//  MineCollectionViewCell.h
//  Save
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 ZhenFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView ;
    UILabel *_titleLabel;
    UIView   *_lineView;
    UIButton *_likeButton;
    UILabel*_priceLabel;
    UILabel*_likeLabel;
    
    
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *likeButton;
@property (nonatomic,strong) UILabel*priceLabel;
@property (nonatomic,strong) UILabel*likeLabel;




@end
