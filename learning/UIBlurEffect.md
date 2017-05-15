# UIBlurEffect
UIBlurEffect를 만들고 그걸 바탕으로 UIVisualEffectView를 만든 후 블러하고자 하는 뷰에 서브뷰로 넣어주기만 하면 됩니다.


```objc
+ (void)blurrView:(UIView *)view
  withEffectStyle:(UIBlurEffectStyle)effectStyle {
    
    UIBlurEffect *blurrEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurrEffect];
    visualEffectView.frame = view.bounds;
    [view addSubview:visualEffectView];
}

+ (void)    blurrView:(UIView *)view
      withEffectStyle:(UIBlurEffectStyle)effectStyle
  animateWithDuration:(CGFloat)duration
                delay:(CGFloat)delay
              options:(UIViewAnimationOptions)options {
    
    UIBlurEffect *blurrEffect = [UIBlurEffect effectWithStyle:effectStyle];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurrEffect];
    visualEffectView.frame = view.bounds;
    [view addSubview:visualEffectView];
    
    [visualEffectView setAlpha:0.0];
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        
        [visualEffectView setAlpha:1.0];
        
    } completion:nil];
    
}
```