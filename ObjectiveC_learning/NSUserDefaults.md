# NSUserDefaults
간단한 설정 정보를 저장하는 곳. 공개되어도 그다지 문제되지 않을 만한 값들만 보관하는 것이 좋다.

인티저, 어레이, 딕셔너리와 숫자 종류를 넣을 수 있다.
불값도 넣을 수 있지만 

```
- (nullable id)objectForKey:(NSString *)defaultName;
- (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
- (void)removeObjectForKey:(NSString *)defaultName;

- (nullable NSString *)stringForKey:(NSString *)defaultName;
- (nullable NSArray *)arrayForKey:(NSString *)defaultName;
- (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName;
- (nullable NSData *)dataForKey:(NSString *)defaultName;

- (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName;

- (NSInteger)integerForKey:(NSString *)defaultName;
- (float)floatForKey:(NSString *)defaultName;
- (double)doubleForKey:(NSString *)defaultName;
- (BOOL)boolForKey:(NSString *)defaultName;
- (nullable NSURL *)URLForKey:(NSString *)defaultName;

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
- (void)setFloat:(float)value forKey:(NSString *)defaultName;
- (void)setDouble:(double)value forKey:(NSString *)defaultName;
- (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
- (void)setURL:(nullable NSURL *)url forKey:(NSString *)defaultName;
```
