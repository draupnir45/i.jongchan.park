# `UIControl`
UIButton의 상위로서 이벤트를 받아 메서드를 실행하는 객체의 최상위 클래스다.

```objc
@property(nonatomic,getter=isEnabled) BOOL enabled;                                  // 기본YES이며, NO의 경우 터치 이벤트를 무시하고, 서브뷰가 다른 식으로 그려질 가능성이 있음.
@property(nonatomic,getter=isSelected) BOOL selected;                                // 기본 NO이며 서브클래스가 필요에 따라 사용할 수 있다.
@property(nonatomic,getter=isHighlighted) BOOL highlighted;                          // 기본은 NO이며, 트래킹 중일 때 터치가 들어오거나 계속되는 동안 자동으로 셋 되며 손을 떼면 클리어된다.
@property(nonatomic) UIControlContentVerticalAlignment contentVerticalAlignment;     // 콘텐츠를 수직으로 정렬합니다. 기본은 중간입니다.
@property(nonatomic) UIControlContentHorizontalAlignment contentHorizontalAlignment; // 콘텐츠를 수평으로 정령합니다. 기본은 중간입니다.

@property(nonatomic,readonly) UIControlState state;                  // 상태를 저장합니다. 하나 이상의 상태가 될 수도 있습니다. (e.g. disabled|selected). 다른 플래그로부터 통합된 값입니다.
@property(nonatomic,readonly,getter=isTracking) BOOL tracking;
@property(nonatomic,readonly,getter=isTouchInside) BOOL touchInside; // 트래킹하는 동안만 유효한 값입니다.

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event;
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event;
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event; // touch is sometimes nil if cancelTracking calls through to this.
- (void)cancelTrackingWithEvent:(nullable UIEvent *)event;   // event may be nil if cancelled for non-event reasons, e.g. removed from window

// 특정 이벤트를 위한 타겟과 액션을 추가합니다. 한 객체에 대해서 여러번 불러서 여러 개의 타겟/액션을 설정할 수 있습니다.
// passing in nil as the target goes up the responder chain. The action may optionally include the sender and the event in that order
// the action cannot be NULL. Note that the target is not retained. 액션은 NULL이 될 수 없습니다. 
- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

// remove the target/action for a set of events. pass in NULL for the action to remove all actions for that target
- (void)removeTarget:(nullable id)target action:(nullable SEL)action forControlEvents:(UIControlEvents)controlEvents;

```