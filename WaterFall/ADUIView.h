//
//  ADUIView.h
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADUIView : UIView

{
    NSString *title;
    NSString *detail;
}

- (NSString *) title;
- (void) setTitle: (NSString *)newTitle;

- (NSString *) detail;
- (void) setDetail: (NSString *)newDetail;

@end
