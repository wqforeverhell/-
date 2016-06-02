//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by 1 on 14-10-31.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
@synthesize imageView;
@synthesize titleLabel;
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
        
        self.countButton=[[UIButton alloc]init];
        [self.countButton setBackgroundImage:[UIImage imageNamed:@"搭配.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.countButton];
        
        self.likeButton=[[UIButton alloc]init];
        [self.likeButton setBackgroundImage:[UIImage imageNamed:@"喜欢2.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.likeButton];
        
        self.placeButton=[[UIButton alloc]init];
//        [placeButton setBackgroundColor:[UIColor blackColor]];
        [self.placeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[self.placeButton setTitle:@"123" forState:UIControlStateNormal];
        [self.contentView addSubview:self.placeButton];
//        placeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        self.countLabel=[[UILabel alloc]init];
        self.countLabel.font=[UIFont systemFontOfSize:10];
        [self.countLabel setText:@"3组商品"];
        [self.contentView addSubview:self.countLabel];
        
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
    
    imageView.frame = CGRectMake(0.0f,0.0f , self.contentView.bounds.size.width, y);
    self.lineView.frame=CGRectMake(5, self.contentView.bounds.size.height-30, 130, 1);
    self.countButton.frame=CGRectMake(5, self.contentView.bounds.size.height-25, 20, 20);
    self.likeButton.frame=CGRectMake(100, self.contentView.bounds.size.height-25, 20, 20);
    self.placeButton.frame=CGRectMake(5, self.contentView.bounds.size.height-70, 35, 35);
    self.placeButton.layer.cornerRadius=17.5;
    self.placeButton.clipsToBounds=YES;
    self.titleLabel.frame=CGRectMake(45, self.contentView.bounds.size.height-70, 60, 35);
    self.countLabel.frame=CGRectMake(30, self.contentView.bounds.size.height-25, 60, 20);
    self.likeLabel.frame=CGRectMake(125, self.contentView.bounds.size.height-25, 25, 20);


}
@end
