//
//  ViewController.h
//  JSTest
//
//  Created by iermu-xiaoqi.zhang on 2017/3/8.
//  Copyright © 2017年 iermu-xiaoqi.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSVCExport <JSExport>

- (void)presentVCWithName:(NSString *)name;

@end

@interface ViewController : UIViewController<JSVCExport>


@end

