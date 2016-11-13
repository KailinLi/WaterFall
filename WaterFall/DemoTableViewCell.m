//
//  DemoTableViewCell.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/12.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell {
    

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
        CGPoint location;
        if (index >= 4) {
            location.x = 20 + (index - 4) * 90;
            location.y = 55;
        }
        else {
            location.x = 20 + index * 90;
            location.y = -15;
        }
        IconUIView *icon = [[IconUIView alloc] initWithFrame:CGRectMake(location.x, location.y, 60, 60)];
        icon.backgroundColor = [UIColor whiteColor];
        icon.title = self.titleData[index];
        icon.image = self.imageData[index];
        [self.contentView addSubview:icon];
    }
    
    
}

- (void) setFrame:(CGRect)frame {
    //
}


@end
