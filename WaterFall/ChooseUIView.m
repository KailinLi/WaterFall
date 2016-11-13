//
//  ChooseUIView.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/13.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "ChooseUIView.h"

@implementation ChooseUIView {
    UILabel *show;
    UILabel *Demo;
    UIImageView *ShowImage;
}

- (void)drawRect:(CGRect)rect {
    CGRect bound = self.bounds;
    self.backgroundColor = [UIColor whiteColor];
    
    Demo = [[UILabel alloc]initWithFrame:CGRectMake(bound.origin.x + bound.size.height * 0.5, bound.origin.y + bound.size.height * 0.1 + 7, bound.size.width + 40, bound.size.height * 0.4)];
    Demo.backgroundColor = [UIColor whiteColor];
    Demo.text = detail;
    [self addSubview:Demo];
    Demo.font = [UIFont fontWithName:@"Arial" size:14];
    Demo.textAlignment = NSTextAlignmentCenter;
    
    show = [[UILabel alloc]initWithFrame:CGRectMake(bound.origin.x + bound.size.height * 0.5, bound.origin.y + bound.size.height * 0.5 + 7, bound.size.width + 40, bound.size.height * 0.3)];
    show.backgroundColor = [UIColor whiteColor];
    show.text = title;
    [self addSubview:show];
    show.font = [UIFont fontWithName:@"Arial" size:12];
    show.textColor = [UIColor orangeColor];
    show.textAlignment = NSTextAlignmentCenter;
    
    ShowImage = [[UIImageView alloc]initWithFrame:CGRectMake(bound.origin.x, bound.origin.y + (bound.size.height - bound.size.height * 0.5) * 0.5, bound.size.width * 0.5, bound.size.height * 0.5)];
    ShowImage.backgroundColor = [UIColor whiteColor];
    [ShowImage setImage:[UIImage imageNamed:image]];
    [self addSubview:ShowImage];
    
    ShowImage.layer.cornerRadius = bound.size.height * 0.5 * 0.5;
    
    ShowImage.layer.masksToBounds = YES;
    
    [ShowImage.layer setBorderWidth:1];
    
    [ShowImage.layer setBorderColor:[UIColor orangeColor].CGColor];
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
- (NSString *) image
{
    return image;
}
- (void) setImage: (NSString *)newImage
{
    image = newImage;
}

@end
