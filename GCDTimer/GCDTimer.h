//
//  GCDTimer.h
//  GCDTimer
//
//  Created by 苗国栋 on 2017/5/2.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GCDTimer;
@protocol GCDTimerDelegate <NSObject>

@optional
- (void)gcdTimerCallBack:(NSInteger)time;

@end
@interface GCDTimer : NSObject
@property (nonatomic , assign) NSInteger timerCount;
@property (nonatomic , strong) dispatch_source_t gcdTimer;
@property (nonatomic , weak) id<GCDTimerDelegate>delegat;

/**
 GCDTimer init

 @param start 现在时间多久开始
 @param interval 时间间隔
 @param work 工作时间  计时时间
 @return GCDTimer
 */
- (instancetype)initGCDTimerWihtStartTime:(NSInteger)start intervalTime:(NSInteger)interval workTime:(NSInteger)work;
//- (void)gcdTimeStart;
- (void)gcdTimeStop;
- (void)startGCDTimerWithStarTime:(NSInteger)start intervalTime:(NSInteger)interval workTime:(NSInteger)work;

@end
