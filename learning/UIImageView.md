#`UIImageView`

```objc
- (instancetype)initWithImage:(nullable UIImage *)image;
- (instancetype)initWithImage:(nullable UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage NS_AVAILABLE_IOS(3_0);

@property (nullable, nonatomic, strong) UIImage *image; // default is nil
@property (nullable, nonatomic, strong) UIImage *highlightedImage NS_AVAILABLE_IOS(3_0); // default is nil
@property (nonatomic, getter=isUserInteractionEnabled) BOOL userInteractionEnabled; // default is NO

@property (nonatomic, getter=isHighlighted) BOOL highlighted NS_AVAILABLE_IOS(3_0); // default is NO
```

- 이미지를 나타내주는 뷰. 애니메이션화 할수 있다는 것과, 하일라이트를 할 수 있다는 점이 강점.

