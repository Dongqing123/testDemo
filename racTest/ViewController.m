//
//  ViewController.m
//  racTest
//
//  Created by YZ on 2017/12/7.
//  Copyright © 2017年 YZ. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "RACReturnSignal.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RACSignal *signal1 = [RACReturnSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"1"];
        [subscriber sendCompleted];
        return nil;
    }];
    RACSignal *signal2 = [RACReturnSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"2"];
        return nil;
    }];
  RACSignal *result =   [ signal1 then:^RACSignal * _Nonnull{
        return signal2;
  }];
    RACSignal *result2 = [signal1 concat:signal2];
    
    [result2  subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
//    [RACSignal combineLatest:<#(nonnull id<NSFastEnumeration>)#> reduce:^ValueType _Nullable{
//        
//    }];
    
    
}

-(void)update:(NSString*)string andupdate2:(NSString*)string2{
    NSLog(@"abcd");
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _label.frame = CGRectMake(100, 100, 100, 100);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
