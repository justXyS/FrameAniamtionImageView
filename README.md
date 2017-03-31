# FrameAniamtionImageView
逐帧加载播放的序列帧动画，内存占用低，精度也较高。自测时间精度高于系统序列帧动画。
Demo中动画有94帧，用系统播放误差有几秒，使用FrameAniamtionImageView误差在500ms以内。（PS:请用真机测试）

***

## 使用示例

```
[self.imageView makeKeyFrameWithContentsOfFiles:paths
    time:^MilliTime(int index, UIImage * _Nonnull image) {
    	return 100;
    } complement:^BOOL(int index) {
        return YES;
    }];
```
