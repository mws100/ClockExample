//
//  ViewController.m
//  ClockExample
//
//  Created by 马文帅 on 16/8/3.
//  Copyright © 2016年 mawenshuai. All rights reserved.
//

#import "ViewController.h"

/** 钟表背景的半径 */
#define KClockRadius CGRectGetWidth(self.clockImageView.frame) * 0.5
/** 角度转弧度 */
#define KAngle2Radian(angle) ((angle) / 180.0 * M_PI)
/** 每秒钟秒针转多少角度 360.0 / 60 */
#define KPerSecondA 6
/** 每分钟分针转多少角度 360.0 / 60 */
#define KPerMinuteA 6
/** 每小时时针转多少角度 360.0 / 12 */
#define KPerHourA 30
/** 每分钟时针转多少角度 360.0 / 12 / 60 */
#define KPerMinuteHourLA 0.5

@interface ViewController ()
/** 当前时间label */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/** 钟表背景图 */
@property (weak, nonatomic) IBOutlet UIImageView *clockImageView;
/** 秒针layer */
@property (nonatomic, strong) CALayer *secondLayer;
/** 分针layer */
@property (nonatomic, strong) CALayer *minuteLayer;
/** 时针layer */
@property (nonatomic, strong) CALayer *hourLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.clockImageView.layer addSublayer:self.hourLayer];
    [self.clockImageView.layer addSublayer:self.minuteLayer];
    [self.clockImageView.layer addSublayer:self.secondLayer];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChanged) userInfo:nil repeats:YES];
    //为了保证程序一运行，时分秒针就在当前时间的位置，需先手动调用下刷新的方法
    [self timeChanged];
}

- (void)timeChanged {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond |NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    self.secondLayer.transform = CATransform3DMakeRotation(KAngle2Radian(cmp.second * KPerSecondA), 0, 0, 1);
    self.minuteLayer.transform = CATransform3DMakeRotation(KAngle2Radian(cmp.minute * KPerMinuteA), 0, 0, 1);
    self.hourLayer.transform = CATransform3DMakeRotation(KAngle2Radian(cmp.hour * KPerHourA + cmp.minute * KPerMinuteHourLA), 0, 0, 1);
    self.timeLabel.text = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", cmp.hour, cmp.minute, cmp.second];
}

#pragma mark - lazy loading
- (CALayer *)secondLayer {
    if (!_secondLayer) {
        _secondLayer = [[CALayer alloc] init];
        _secondLayer.backgroundColor = [UIColor redColor].CGColor;
        _secondLayer.anchorPoint = CGPointMake(0.5, 0.9);
        _secondLayer.position = CGPointMake(KClockRadius, KClockRadius);
        _secondLayer.bounds = CGRectMake(0, 0, 1, KClockRadius-10);
    }
    return _secondLayer;
}

- (CALayer *)minuteLayer {
    if (!_minuteLayer) {
        _minuteLayer = [[CALayer alloc] init];
        _minuteLayer.backgroundColor = [UIColor blackColor].CGColor;
        _minuteLayer.anchorPoint = CGPointMake(0.5, 1);
        _minuteLayer.position = CGPointMake(KClockRadius, KClockRadius);
        _minuteLayer.bounds = CGRectMake(0, 0, 2, KClockRadius-20);
        _minuteLayer.cornerRadius = 2;
    }
    return _minuteLayer;
}

- (CALayer *)hourLayer {
    if (!_hourLayer) {
        _hourLayer = [[CALayer alloc] init];
        _hourLayer.backgroundColor = [UIColor blackColor].CGColor;
        _hourLayer.anchorPoint = CGPointMake(0.5, 1);
        _hourLayer.position = CGPointMake(KClockRadius, KClockRadius);
        _hourLayer.bounds = CGRectMake(0, 0, 4, KClockRadius-45);
        _hourLayer.cornerRadius = 4;
    }
    return _hourLayer;
}

@end
