#리터럴 문법

코드를 간소화할 수 있도록 하는 문법이다. 

```objc
//NSString Literal
	NSString *str = @"HEY";

//NSNumber Literal
	NSNumebr *int = @1942;
	NSNumber *bool = @YES;

//NSArray, NSDictionary and their mutables
	NSArray *someArray = @[firstObject, secondObject, thirdObject];
	NSDictionary *dictionary = @{
                  @"anObject" : someObject,
               @"helloString" : @"Hello, World!",
               @"magicNumber" : @42,
                    @"aValue" : someValue
	};
	
```

또는 정수값을 사람이 알아볼 수 있는 것으로 바꾸기 위해서도 사용한다.

```objc
typedef NS_ENUM(NSInteger, UIViewContentMode) {
    UIViewContentModeScaleToFill,
    UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
    UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
};

```

