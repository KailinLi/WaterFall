//
//  ShowTableViewCell.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/10.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "ShowTableViewCell.h"
#import "Data.h"

@implementation ShowTableViewCell {
    UILabel *title;
    UILabel *detail;
    UILabel *price;
    UILabel *hadSaled;
    UILabel *distance;
    UIImageView *imageName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize size = self.contentView.bounds.size;
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 50, 20)];
        [self.contentView addSubview:title];
        
        detail = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, 50, 20)];
        [self.contentView addSubview:detail];
        
        price = [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 50, 20)];
        [self.contentView addSubview:price];
        
        hadSaled = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 50, 20)];
        [self.contentView addSubview:hadSaled];
        
        distance = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, 50, 20)];
        [self.contentView addSubview:distance];
        
        imageName = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.contentView addSubview:imageName];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    title.text = [self.data title];
    detail.text = [self.data detail];
    price.text = [self.data price];
    hadSaled.text = [self.data hadSaled];
    distance.text = [self.data distance];
    [imageName setImage:[UIImage imageNamed:[self.data imageName]]];
    
}

@end
