//
//  ChooseTableViewCell.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "ChooseTableViewCell.h"

@implementation ChooseTableViewCell

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
        CGPoint location;
        if (index >= 2) {
            location.x = 20 + (index - 2) * size.width * 0.5;
            location.y = 55;
        }
        else {
            location.x = 20 + index * size.width * 0.5;
            location.y = -5;
        }
        ChooseUIView *icon = [[ChooseUIView alloc] initWithFrame:CGRectMake(location.x, location.y, size.height *   0.51, size.height * 0.51)];
        icon.backgroundColor = [UIColor whiteColor];
        icon.title = self.titleData[index];
        icon.detail = self.detailData[index];
        icon.image = self.imageData[index];
        [self.contentView addSubview:icon];
    }
    
    
}

- (void) setFrame:(CGRect)frame {
    //
}

@end
