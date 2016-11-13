//
//  IconUIView.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/12.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "IconUIView.h"

@implementation IconUIView {
    UILabel *show;
    UIImageView *Demo;
}

- (void)drawRect:(CGRect)rect {
    CGRect bound = self.bounds;
    Demo = [[UIImageView alloc]initWithFrame:CGRectMake(bound.origin.x + (bound.size.width - bound.size.width * 0.7) * 0.5, bound.origin.y, bound.size.width * 0.7, bound.size.height * 0.7)];
    Demo.backgroundColor = [UIColor whiteColor];
    [Demo setImage:[UIImage imageNamed:image]];
    
    
    Demo.layer.cornerRadius = bound.size.height * 0.7 * 0.5;
    
    Demo.layer.masksToBounds = YES;
    
    [Demo.layer setBorderWidth:1];
    
    [Demo.layer setBorderColor:[UIColor colorWithRed:0/255.0 green:201.0/255.0 blue:177.0/255.0 alpha:1.0].CGColor];
    
    [self addSubview:Demo];
    show = [[UILabel alloc]initWithFrame:CGRectMake(bound.origin.x, bound.origin.y + bound.size.height * 0.7, bound.size.width, bound.size.height * 0.3)];
    show.backgroundColor = [UIColor whiteColor];
    show.text = title;
    
    show.font = [UIFont fontWithName:@"Arial" size:12];
    show.textAlignment = NSTextAlignmentCenter;
    [self addSubview:show];
}

- (NSString *) image
{
    return image;
}
- (void) setImage: (NSString *)newImage
{
    image = newImage;
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
