//
//  IconUIView.h
//  WaterFall
//
//  Created by 李恺林 on 2016/11/12.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IconUIView : UIView

{
    NSString *image;
    NSString *title;
}

- (NSString *) image;
- (void) setImage: (NSString *)newImage;

- (NSString *) title;
- (void) setTitle: (NSString *)newTitle;

@end
