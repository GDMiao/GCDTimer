//
//  ViewController.m
//  GCDTimer
//
//  Created by 苗国栋 on 2017/5/2.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import "ViewController.h"
#import "GCDTimer.h"
@interface ViewController ()<GCDTimerDelegate>
{
    int count;
}
@property (nonatomic, strong) dispatch_source_t gcdTimer;
@property (nonatomic, strong) GCDTimer *ggTimer;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpGCDTimer];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建Lab了 用于显示时间

    self.timeLable.textAlignment = NSTextAlignmentCenter;
    self.timeLable.font = [UIFont systemFontOfSize:20];
    self.timeLable.textColor = [UIColor blueColor];
    self.timeLable.text = @"倒计时";
    [self.view addSubview:self.timeLable];
    
    //创建GCDTimer 初始化定时器  startTime：现在时间1.0秒后开始  intervalTime：时间间隔 1.0 秒 workTime：计时时间 30 秒
    self.ggTimer = [[GCDTimer alloc]init];
    // 定时器 开始工作
//    [self.ggTimer gcdTimeStart];
    // 设置代理 GCDTimerDelegate
    self.ggTimer.delegat = self;
    
}
#pragma mark GDCTImer Delegate Method
- (void)gcdTimerCallBack:(NSInteger)time
{
    self.timeLable.text = [NSString stringWithFormat:@" %ld",time];
    NSLog(@" work time %ld" , time);
}

- (IBAction)timeStartAction:(id)sender {
    // startTime：现在时间1.0秒后开始  intervalTime：时间间隔 1.0 秒 workTime：计时时间 30 秒
    [self.ggTimer startGCDTimerWithStarTime:0.0 intervalTime:1.0 workTime:20];
    
}

- (IBAction)timeStopAction:(id)sender {
    [self.ggTimer gcdTimeStop];
    self.timeLable.text = @"0";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
