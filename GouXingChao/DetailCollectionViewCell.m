//
//  CollectionViewCell.m
//  GouXingChao
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell
@synthesize imageView,likeImageView;
@synthesize priceLabel,likeLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        self.contentView.backgroundColor=[UIColor whiteColor];
        
        
        priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        
        likeImageView=[[UIImageView alloc]init];
        [self.contentView addSubview:likeImageView];
        
        likeLabel = [[UILabel alloc] init];
        likeLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:likeLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    float y =self.contentView.bounds.size.height-25;
    
    imageView.frame = CGRectMake(0,0 , self.contentView.bounds.size.width, y);
    priceLabel.frame = CGRectMake(5,y , 50, 25);
    likeImageView.frame=CGRectMake(100, y, 20, 25);
    likeLabel.frame=CGRectMake(120, y, 30, 25);
    
}

@end
