//
//  ViewController.m
//  JSTest
//
//  Created by iermu-xiaoqi.zhang on 2017/3/8.
//  Copyright © 2017年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "ViewController.h"
#import "JSExportModel.h"
#import "NameViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *context;
@property (nonatomic, strong) JSExportModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = nil;
    NSString *path = nil;
    path = [[NSBundle mainBundle] pathForResource:@"hehe" ofType:@"html"];
    url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
    [self.view addSubview:_webView];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
    
        NSLog(@"%@", exception);
    };
    
    /*JS Call OC
     *
     *  1.使用JSExport，把OC的类，类方法，实例方法，属性暴露给JavaScript的code中调用
     *
     *  2.使用[context objectForKeyedSubscript:] or [value objectForKeyedSubscript:]等
     *    JavaScript的所有事物都是对象
     */
    
    //方法1.important:以JSExport协议关联JSExportModel的属性，类方法，实例方法。
    self.context[@"JSExportModel"] = [JSExportModel class];
    self.context[@"vc"] = self;
    
    //方法2
    __weak typeof(ViewController *) weakSelf = self;
    self.context[@"displayGuoName"] = ^(NSString *name) {
    
        UIAlertController *al = [UIAlertController alertControllerWithTitle:@"displayGuoName" message:name preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
        [al addAction:cancel];
        [weakSelf presentViewController:al animated:YES completion:nil];
    };
    
    self.context[@"calSumActive"] = ^{
    
        [weakSelf OCCallJSCalSum];
    };
}

- (void)presentVCWithName:(NSString *)name {
    
    NameViewController *vc = [[NameViewController alloc] init];
    JSValue *model = self.context[@"touModel"];
    NSString *modelName = [[model valueForProperty:@"name"] toString];
#if 1
    vc.name = modelName;
#else
    vc.name = name;
#endif
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)OCCallJSCalSum {

    /* OC Call JS
     *
     *  通过JSValue来访问JavaScript对象
     */
    JSValue *calSum = self.context[@"calSum"];
    NSInteger sum = [[[calSum callWithArguments:@[@1, @2]] toNumber] integerValue];
    UIAlertController *al = [UIAlertController alertControllerWithTitle:@"calSum" message:[NSString stringWithFormat:@"sum结果：%@", @(sum)] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [al addAction:cancel];
    [self presentViewController:al animated:YES completion:nil];
}

@end
