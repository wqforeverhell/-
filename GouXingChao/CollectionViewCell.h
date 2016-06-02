//
//  CollectionViewCell.h
//  UICollectionViewDemo
//
//  Created by 1 on 14-10-31.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView ;
    UILabel *_titleLabel;
    UIView   *_lineView;
    UIButton *_countButton;
    UIButton *_likeButton;
    UIButton *_placeButton;
    UILabel*_countLabel;
    UILabel*_likeLabel;
    
    
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *countButton;
@property (nonatomic,strong) UIButton *likeButton;
@property (nonatomic,strong) UIButton *placeButton;
@property (nonatomic,strong) UILabel*countLabel;
@property (nonatomic,strong) UILabel*likeLabel;



@end
