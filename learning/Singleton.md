# Singleton Design Pattern

프로그램 전체에서 단 한 번만 만들어지도록 설계하여 사용하는 디자인 방법론.

### 코드 스니펫 (Objective-C)
```objc
+ (instancetype)sharedData {
    
    static PokemonDataSingleton *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
    	//단 한 번만 실행될 코드를 넣습니다. 이 코드에서는 여기서 초기화하므로, 프로그램 생애주기동안 딱 한 번만 초기화됩니다.
        instance = [[PokemonDataSingleton alloc] init];
    });
    
    return instance;
}
```