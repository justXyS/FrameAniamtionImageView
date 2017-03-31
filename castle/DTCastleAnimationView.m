//
//  DTCastleAnimationView.m
//  castle
//
//  Created by xiaoyuan on 2017/3/29.
//  Copyright © 2017年 xiaoyuan. All rights reserved.
//

#import "DTCastleAnimationView.h"

@interface DTCastleAnimationView()

@property (nonatomic, strong) UIImageView *receiverAvatarImageView; //主播头像
@property (nonatomic, strong) UIImageView *senderAvatarImageView; //赠送人头像

@end

@implementation DTCastleAnimationView

- (void)dealloc {
    
}

- (void)customSetUp {
    [super customSetUp];
    [self addSubview:self.receiverAvatarImageView];
    [self addSubview:self.senderAvatarImageView];
    _receiverAvatarImageView.center = CGPointMake(-kScale(25), kScreenHeight / 2);
    _senderAvatarImageView.center = CGPointMake(kScreenWidth + kScale(25), kScreenHeight / 2);
}

- (void)begin {
    [super begin];
    
    [UIView animateWithDuration:0.5 delay:4.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _receiverAvatarImageView.center = CGPointMake(kScreenWidth/2 - kScale(25), kScale(200));
        _senderAvatarImageView.center = CGPointMake(kScreenWidth/2 + kScale(25), kScale(200));
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.875 animations:^{
            _receiverAvatarImageView.center = CGPointMake(kScreenWidth/2 - kScale(75), kScale(200));
            _senderAvatarImageView.center = CGPointMake(kScreenWidth/2 + kScale(90), kScale(200));
        }];
        [UIView animateWithDuration:0.1875 animations:^{
            _receiverAvatarImageView.transform = CGAffineTransformMakeScale(0.5, 1);
            _senderAvatarImageView.transform = CGAffineTransformMakeScale(0.5, 1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1875 animations:^{
                _receiverAvatarImageView.transform = CGAffineTransformIdentity;
                _senderAvatarImageView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                CGPoint receiverAvatarImageViewCenter = _receiverAvatarImageView.center;
                CGPoint senderAvatarImageViewCenter = _senderAvatarImageView.center;
                
                [self shakeAnimationWithReceiverAvatarCenter:receiverAvatarImageViewCenter senderAvatarCenter:senderAvatarImageViewCenter];
            }];
        }];
    }];
    [UIView animateWithDuration:1.75 delay:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _receiverAvatarImageView.alpha = 0;
        _senderAvatarImageView.alpha = 0;
    } completion:nil];
}

- (CGPoint)shakePositionFor:(CGPoint)center {
    NSInteger x = (int)(arc4random() % 7) - 3 + center.x;
    NSInteger y = (int)(arc4random() % 7) - 3 + center.y;
    return CGPointMake(x, y);
}

- (void)shakeAnimationWithReceiverAvatarCenter:(CGPoint)rcenter senderAvatarCenter:(CGPoint)scenter {
    [UIView animateWithDuration:0.6 animations:^{
        _receiverAvatarImageView.center = [self shakePositionFor:rcenter];
        _senderAvatarImageView.center = [self shakePositionFor:scenter];
    } completion:^(BOOL finished) {
        if (self.animating) {
            [self shakeAnimationWithReceiverAvatarCenter:rcenter senderAvatarCenter:scenter];
        }
    }];
}

- (UIImageView *)receiverAvatarImageView {
    if (!_receiverAvatarImageView) {
        _receiverAvatarImageView = [UIImageView new];
        _receiverAvatarImageView.backgroundColor = [UIColor redColor];
        _receiverAvatarImageView.frame = CGRectMake(0, 0, kScale(50), kScale(50));
        _receiverAvatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _receiverAvatarImageView.layer.borderWidth = 3;
        _receiverAvatarImageView.layer.masksToBounds = YES;
        _receiverAvatarImageView.layer.cornerRadius = kScale(25);
    }
    return _receiverAvatarImageView;
}

- (UIImageView *)senderAvatarImageView {
    if (!_senderAvatarImageView) {
        _senderAvatarImageView = [UIImageView new];
        _senderAvatarImageView.backgroundColor = [UIColor redColor];
        _senderAvatarImageView.frame = CGRectMake(0, 0, kScale(50), kScale(50));
        _senderAvatarImageView.layer.cornerRadius = kScale(25);
        _senderAvatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _senderAvatarImageView.layer.borderWidth = 3;
        _senderAvatarImageView.layer.masksToBounds = YES;
    }
    return _senderAvatarImageView;
}

@end
