# FrameAniamtionImageView
逐帧加载播放的序列帧动画，内存占用低，精度也较高。自测时间误差高于系统序列帧动画

***

## 使用示例
***

`   DTWeakObj(self);
    [self.imageView makeKeyFrameWithContentsOfFiles:paths time:^MilliTime(int index, UIImage * _Nonnull image) {
        return 100;
    } complement:^BOOL(int index) {
        return YES;
    }];
`


