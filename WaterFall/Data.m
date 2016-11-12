//
//  Data.m
//  WaterFall
//
//  Created by 李恺林 on 2016/11/10.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import "Data.h"

@implementation Data

- (id) init
{
    if (self = [super init]) {
        title = @"";
        detail = @"";
        price = @"";
        hadSaled = @"";
        distance = @"";
        imageName = @"";
    }
    return self;
}

- (NSString *) title
{
    return title;
}

- (void) setTitle:(NSString *)newTitle
{
    title = newTitle;
}

- (NSString *) detail
{
    return detail;
}

- (void) setDetail :(NSString *)newDetail
{
    detail = newDetail;
}

- (NSString *) price
{
    return price;
}

- (void) setPrice :(NSString *)newPrice
{
    price = newPrice;
}

- (NSString *) hadSaled
{
    return hadSaled;
}

- (void) setHadSaled :(NSString *)newHadSaled
{
    hadSaled = newHadSaled;
}

- (NSString *) distance
{
    return distance;
}

- (void) setDistance :(NSString *)newDistance
{
    distance = newDistance;
}

- (NSString *) imageName
{
    return imageName;
}

- (void) setImageName :(NSString *)newImageName
{
    imageName = newImageName;
}

@end
