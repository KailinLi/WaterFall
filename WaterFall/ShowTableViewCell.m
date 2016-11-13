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
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, 150, 25)];
        [self.contentView addSubview:title];
        title.font = [UIFont fontWithName:@"Arial" size:17];
        //title.textAlignment = NSTextAlignmentCenter;
        
        detail = [[UILabel alloc]initWithFrame:CGRectMake(70, 32, 150, 10)];
        [self.contentView addSubview:detail];
        detail.font = [UIFont fontWithName:@"Arial" size:12];
        detail.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1.0];
        //detail.textAlignment = NSTextAlignmentCenter;
        
        price = [[UILabel alloc]initWithFrame:CGRectMake(70, 42, 150, 25)];
        [self.contentView addSubview:price];
        price.font = [UIFont fontWithName:@"Arial" size:18];
        price.textColor = [UIColor colorWithRed:0/255.0 green:201.0/255.0 blue:177.0/255.0 alpha:1.0];
        //price.textAlignment = NSTextAlignmentCenter;
        
        hadSaled = [[UILabel alloc]initWithFrame:CGRectMake(size.width - 100, 25, 150, 20)];
        [self.contentView addSubview:hadSaled];
        hadSaled.font = [UIFont fontWithName:@"Arial" size:12];
        hadSaled.textAlignment = NSTextAlignmentRight;
        hadSaled.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1.0];
        
        distance = [[UILabel alloc]initWithFrame:CGRectMake(size.width - 100, 45, 150, 25)];
        [self.contentView addSubview:distance];
        distance.font = [UIFont fontWithName:@"Arial" size:12];
        distance.textAlignment = NSTextAlignmentRight;
        distance.textColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1.0];
        
        imageName = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
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
