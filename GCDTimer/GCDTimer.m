//
//  GCDTimer.m
//  GCDTimer
//
//  Created by 苗国栋 on 2017/5/2.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import "GCDTimer.h"
#define endTime 0
@implementation GCDTimer
- (instancetype)initGCDTimerWihtStartTime:(NSInteger)start intervalTime:(NSInteger)interval workTime:(NSInteger)work
{
    if (self == [super init]) {
        
//        _timerCount = work;
//        NSLog(@"创建 GCD 定时器");
//        // 获取队列
//        dispatch_queue_t mainQueue = dispatch_get_main_queue();
//        // 创建GCD定时器
//        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, mainQueue);
//        self.gcdTimer = timer;
//        // 设置开始时间
//        dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (start * NSEC_PER_SEC));
//        // 设置时间间隔
//        uint64_t intervalTime = (uint64_t)(interval * NSEC_PER_SEC);
//        // 设置定时器
//        dispatch_source_set_timer(self.gcdTimer, startTime, intervalTime, 0);
//        // 设置回调
//        __weak typeof(self) weakSelf = self;
//        dispatch_source_set_event_handler(self.gcdTimer, ^{
//            __block typeof(weakSelf) strongSelf = weakSelf;
//            //NSLog(@"gcdTime ++ %ld", _timerCount);
//            if ( strongSelf.delegat && [strongSelf.delegat respondsToSelector:@selector(gcdTimerCallBack:)]) {
//                [strongSelf.delegat gcdTimerCallBack:_timerCount];
//            }
//            _timerCount--;
//            if (_timerCount < endTime) {
//                dispatch_cancel(strongSelf.gcdTimer);
//                self.gcdTimer = nil;
//                NSLog(@"gcdTime 停止");
//                
//            }
//        });
        // 开始启动定时器
        //dispatch_resume(self.gcdTimer);
    }
    
    return self;
}
// 开始启动 定时器
- (void)startGCDTimerWithStarTime:(NSInteger)start intervalTime:(NSInteger)interval workTime:(NSInteger)work
{
    _timerCount = work;
    NSLog(@"创建 GCD 定时器");
    // 获取队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // 创建GCD定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, mainQueue);
    self.gcdTimer = timer;
    // 设置开始时间
    dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (start * NSEC_PER_SEC));
    // 设置时间间隔
    uint64_t intervalTime = (uint64_t)(interval * NSEC_PER_SEC);
    // 设置定时器
    dispatch_source_set_timer(self.gcdTimer, startTime, intervalTime, 0);
    // 设置回调
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        __block typeof(weakSelf) strongSelf = weakSelf;
        //NSLog(@"gcdTime ++ %ld", _timerCount);
        if ( strongSelf.delegat && [strongSelf.delegat respondsToSelector:@selector(gcdTimerCallBack:)]) {
            [strongSelf.delegat gcdTimerCallBack:_timerCount];
        }
        _timerCount--;
        if (_timerCount < endTime) {
            dispatch_cancel(strongSelf.gcdTimer);
            self.gcdTimer = nil;
            NSLog(@"gcdTime 停止");
            
        }
    });
    // 开始启动定时器
    dispatch_resume(self.gcdTimer);
}

//- (void)gcdTimeStart
//{
//    //启动定时器
//    if (!self.gcdTimer) {
//        //
//    }else{
//        dispatch_resume(self.gcdTimer);
//    }
//    
//}

- (void)gcdTimeStop
{
    //关闭定时器
    NSLog(@"gcdTime 停止");
    if (self.gcdTimer) {
        dispatch_cancel(self.gcdTimer);
        self.gcdTimer =nil;
    }
}
@end
