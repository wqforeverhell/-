//
//  ZYBJTableViewCell.m
//  GouXingChao
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ZYBJTableViewCell.h"

@implementation ZYBJTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 220, 40)];
        self.nameLabel.numberOfLines=0;
        self.nameLabel.font=[UIFont systemFontOfSize:12];
        ///self.nameLabel.backgroundColor=[UIColor redColor];
        [self addSubview:self.nameLabel];
        
        self.prictLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 50, 60, 20)];
        self.prictLabel.font=[UIFont systemFontOfSize:10];
        self.prictLabel.textColor=[UIColor redColor];
        //self.prictLabel.backgroundColor=[UIColor redColor];
        [self addSubview:self.prictLabel];
        
        self.numLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 50, 65, 20)];
        self.numLabel.font=[UIFont systemFontOfSize:10];
        //self.numLabel.backgroundColor=[UIColor redColor];
        [self addSubview:self.numLabel];
        
        self.likeLabel=[[UILabel alloc]initWithFrame:CGRectMake(270, 50, 20, 20)];
        self.likeLabel.font=[UIFont systemFontOfSize:10];
        self.likeLabel.textColor=[UIColor redColor];
        //self.likeLabel.backgroundColor=[UIColor redColor];
        [self addSubview:self.likeLabel];
        
        self.likeButton =[[UIButton alloc]initWithFrame:CGRectMake(240, 50, 20, 20)];
        //self.likeButton.backgroundColor=[UIColor redColor];
        [self addSubview:self.likeButton];
        
        
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
