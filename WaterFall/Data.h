//
//  Data.h
//  WaterFall
//
//  Created by 李恺林 on 2016/11/10.
//  Copyright © 2016年 李恺林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

{
    NSString *title;
    NSString *detail;
    NSString *price;
    NSString *hadSaled;
    NSString *distance;
    NSString *imageName;
}

- (NSString *) title;
- (void) setTitle :(NSString *)newTitle;
- (NSString *) detail;
- (void) setDetail :(NSString *)newDetail;
- (NSString *) price;
- (void) setPrice :(NSString *)newPrice;
- (NSString *) hadSaled;
- (void) setHadSaled :(NSString *)newHadSaled;
- (NSString *) distance;
- (void) setDistance :(NSString *)newDistance;
- (NSString *) imageName;
- (void) setImageName :(NSString *)newImageName;

@end
