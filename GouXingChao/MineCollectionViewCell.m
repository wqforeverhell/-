//
//  MineCollectionViewCell.m
//  Save
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 ZhenFan. All rights reserved.
//

#import "MineCollectionViewCell.h"

@implementation MineCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:self.imageView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:self.titleLabel];
        
        
        self.lineView=[[UIView alloc]init];
        self.lineView.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:self.lineView];
        
        
        self.likeButton=[[UIButton alloc]init];
        [self.likeButton setBackgroundImage:[UIImage imageNamed:@"喜欢2.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.likeButton];
        
        
        self.priceLabel=[[UILabel alloc]init];
        self.priceLabel.textColor = [UIColor redColor];
        self.priceLabel.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.priceLabel];
        
        self.likeLabel=[[UILabel alloc]init];
        [self.likeLabel setText:@"喜欢"];
        self.likeLabel.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.likeLabel];
        
        self.backgroundColor=[UIColor whiteColor];
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    float y =self.contentView.bounds.size.height-70.0f;
    
    self.imageView.frame = CGRectMake(0.0f,0.0f , self.contentView.bounds.size.width, y);
    self.lineView.frame=CGRectMake(5, self.contentView.bounds.size.height-30, 130, 1);
    self.likeButton.frame=CGRectMake(100, self.contentView.bounds.size.height-25, 20, 20);
    self.titleLabel.frame=CGRectMake(5, self.contentView.bounds.size.height-70, 138, 45);
    self.priceLabel.frame=CGRectMake(10, self.contentView.bounds.size.height-25, 60, 20);
    self.likeLabel.frame=CGRectMake(125, self.contentView.bounds.size.height-25, 25, 20);
}

@end
