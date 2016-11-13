//
//  ChooseUIView.h
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseUIView : UIView

{
    NSString *title;
    NSString *detail;
    NSString *image;
}

- (NSString *) title;
- (void) setTitle: (NSString *)newTitle;

- (NSString *) detail;
- (void) setDetail: (NSString *)newDetail;

- (NSString *) image;
- (void) setImage: (NSString *)newImage;

@end
