//
//  DTAnimationView.h
//  xllive
//
//  Created by xiaoyuan on 2016/12/28.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAnimationProtocol.h"

#define kScreenWidth               [UIScreen mainScreen].bounds.size.width
#define kScreenHeight              [UIScreen mainScreen].bounds.size.height
#define DTWeakObj(o)   @autoreleasepool {} __weak typeof(o) o ## Weak = o;
#define kScale(point) ((point) * (([UIScreen mainScreen].bounds.size.height == 480 || [UIScreen mainScreen].bounds.size.height == 568) ? 0.85 : ([UIScreen mainScreen].bounds.size.height == 667 ? 1 : 1.1)))

@protocol DTAnimationViewDataSource <NSObject>

//- (NSArray<NSString *> *)imagePaths ;
//- (int)animationDuration ;
//- (CGSize)animationViewSize ;

@optional
- (void)customSetUp;

@end

@interface DTAnimationView : UIView <DTAnimationProtocol, DTAnimationViewDataSource>

@property (nonatomic, assign) int duration;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, strong) NSArray<NSString *> *imagePathss;

@end
