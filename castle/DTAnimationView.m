//
//  DTAnimationView.m
//  xllive
//
//  Created by xiaoyuan on 2016/12/28.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import "DTAnimationView.h"
#import "Masonry.h"
#import "YCFrameAnimator.h"

//屏幕

@interface DTAnimationView() <CAAnimationDelegate>

@property (nonatomic, assign) BOOL isClean;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) CFAbsoluteTime time;

@end

@implementation DTAnimationView

@synthesize animating = _animating;

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]) {
        [self setUp];
    }
    return self;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.superview) {
        
        UIImage *image = [UIImage imageWithContentsOfFile:self.imagePathss.lastObject];
        
        DTWeakObj(self);
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            typeof(selfWeak) self = selfWeak;
            make.centerX.equalTo(self);
            if (![@"bottom" isEqualToString:self.position]) {
                make.centerY.equalTo(self).offset(-30);
            } else {
                make.bottom.equalTo(self);
            }
            make.size.mas_equalTo(CGSizeMake(kScale(image.size.width / 2), kScale(image.size.height / 2)));
        }];
    }
}

- (void)setUp {
    self.userInteractionEnabled = NO;
    [self addSubview:self.imageView];
    [self customSetUp];
}

- (void)begin {
    self.animating = YES;
    NSArray *paths = self.imagePathss;
    int count = (int)paths.count;
    int duration = self.duration;
    if (duration == 0 || count == 0) {
        [self removeFromSuperview];
        return;
    }
    
    int frameTime = duration / count;
    _time = CFAbsoluteTimeGetCurrent();
    
    DTWeakObj(self);
    [self.imageView makeKeyFrameWithContentsOfFiles:paths time:^MilliTime(int index, UIImage * _Nonnull image) {
        return frameTime;
    } complement:^BOOL(int index) {
        if (index == count - 1) {
            CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
            NSLog(@"cost time:%i....%f",index,time1 - _time);
            dispatch_async(dispatch_get_main_queue(), ^{
                [selfWeak clean];
            });
        } else if (index == count - 4) { //倒数第三帧开始alpha降低
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:frameTime/1000.0 * 3 animations:^{
                    selfWeak.imageView.alpha = 0;
                }];
            });
        }
        
        return YES;
    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
    NSLog(@"....%f",time1 - _time);
}

- (void)clean {
    self.animating = NO;
    self.isClean = YES;
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)customSetUp {
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

@end
