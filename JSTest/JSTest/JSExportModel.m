//
//  JSExportModel.m
//  JSTest
//
//  Created by iermu-xiaoqi.zhang on 2017/3/9.
//  Copyright © 2017年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "JSExportModel.h"

@implementation JSExportModel

@synthesize name = _name;
@synthesize sex = _sex;

- (instancetype)initWithName:(NSString *)name sex:(NSString *)sex {

    if (self = [super init]) {
        _name = name;
        _sex = sex;
    }
    return self;
}

+ (JSExportModel *)createJSExportModelWithName:(NSString *)name sex:(NSString *)sex {

    return [[self alloc] createJSExportModelWithName:name sex:sex];
}

- (JSExportModel *)createJSExportModelWithName:(NSString *)name sex:(NSString *)sex {

    return [self initWithName:name sex:sex];
}

- (NSString *)inCorporateName:(NSString *)name sex:(NSString *)sex {

    return [NSString stringWithFormat:@"%@:%@", name, sex];
}


@end
