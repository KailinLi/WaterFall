//
//  ADUIView.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "ADUIView.h"

@implementation ADUIView {
    UILabel *show;
    UILabel *Demo;
}

- (void)drawRect:(CGRect)rect {
    CGRect bound = self.bounds;
    Demo = [[UILabel alloc]initWithFrame:CGRectMake(bound.origin.x, bound.origin.y, bound.size.width * 0.2, bound.size.height)];
    Demo.backgroundColor = [UIColor whiteColor];
    Demo.textColor = [UIColor redColor];
    Demo.text = detail;
    Demo.font = [UIFont fontWithName:@"Arial" size:11];
    Demo.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:Demo];
    show = [[UILabel alloc]initWithFrame:CGRectMake(bound.origin.x + bound.size.width * 0.2, bound.origin.y, bound.size.width * 0.8, bound.size.height)];
    show.backgroundColor = [UIColor whiteColor];
    show.text = title;
    
    show.font = [UIFont fontWithName:@"Arial" size:11];
    //show.textAlignment = NSTextAlignmentCenter;
    [self addSubview:show];
}

- (NSString *) detail
{
    return detail;
}
- (void) setDetail:(NSString *)newDetail
{
    detail = newDetail;
}

- (NSString *) title
{
    return title;
}
- (void) setTitle: (NSString *)newTitle
{
    title = newTitle;
}

@end
