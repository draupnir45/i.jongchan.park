#NSNotificationCenter

특정 상황이 일어났을 때 리얼타임으로 다른 객체에게 메시지를 송신합니다.
사용한 경우 dealloc을 오버라이드하여 옵저버를 지워 줍니다.


```objc
//옵저버 추가
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;

//포스팅
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

//지워줄 것(dealloc)
- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

```