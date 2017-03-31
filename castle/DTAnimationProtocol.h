//
//  DTAnimationProtocol.h
//  iThunder
//
//  Created by xyxxllh on 16/8/12.
//  Copyright © 2016年 xunlei.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTGiftAnimationModel;

@protocol DTAnimationProtocol <NSObject>

@property (nonatomic, assign) BOOL animating;

- (void) begin;
- (void) clean;

@optional
@property (nonatomic ,strong) DTGiftAnimationModel *giftAnimationModel;
@property (nonatomic, copy) NSString *receiveAvatar;

- (void)setGiftAnimationModel:(DTGiftAnimationModel *)giftAnimationModel receiveAvater:(NSString *)receiveAvatar;


@end
