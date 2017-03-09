//
//  JSExportModel.h
//  JSTest
//
//  Created by iermu-xiaoqi.zhang on 2017/3/9.
//  Copyright © 2017年 iermu-xiaoqi.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@class JSExportModel;

@protocol JSModelExport <JSExport>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;

- (instancetype)initWithName:(NSString *)name sex:(NSString *)sex;

- (NSString *)description;

+ (JSExportModel *)createJSExportModelWithName:(NSString *)name
                                           sex:(NSString *)sex;

JSExportAs(inCorporateNameAndSex, - (NSString *)inCorporateName:(NSString *)name sex:(NSString *)sex);

@end


@interface JSExportModel : NSObject<JSModelExport>

@end
