//
//  ADTableViewCell.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "ADTableViewCell.h"

@implementation ADTableViewCell {
    UIImageView *hot;
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
        
        //        imageName = [[UIImageView alloc]initWithFrame:CGRectMake(150, 0, 60, 60)];
        //        [self.contentView addSubview:imageName];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.contentView.bounds.size;
    
    
    for (NSUInteger index = 0; index < self.titleData.count; index++) {
        ADUIView *icon = [[ADUIView alloc] initWithFrame:CGRectMake(50, index * 20, size.width, 20)];
        icon.backgroundColor = [UIColor whiteColor];
        icon.title = self.titleData[index];
        icon.detail = self.detailData[index];
        [self.contentView addSubview:icon];
    }
    hot = [[UIImageView alloc]initWithFrame:CGRectMake(18, 0, size.height, size.height)];
    [hot setImage:[UIImage imageNamed:@"royaloak.jpg"]];
    
    [self.contentView addSubview:hot];
    
    hot.layer.cornerRadius = size.height * 0.7 * 0.35;
    
    hot.layer.masksToBounds = YES;
    
    [hot.layer setBorderWidth:1];
    
    [hot.layer setBorderColor:[UIColor redColor].CGColor];
    
    
}

- (void) setFrame:(CGRect)frame {
    //
}


@end
