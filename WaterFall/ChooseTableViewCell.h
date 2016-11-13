//
//  ChooseTableViewCell.h
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseUIView.h"

@interface ChooseTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *titleData;
@property (nonatomic, strong) NSMutableArray *detailData;
@property (nonatomic, strong) NSMutableArray *imageData;

@end
