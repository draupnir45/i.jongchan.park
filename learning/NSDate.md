##NSDate / NSDateFormatter

`NSDate`는 어떤 날짜를 담고 있는 정보. 시간대, 초까지 모두 담고 있다. 따라서 그 정보 중 필요한 정보를 필요한 상황에 따라 가져와서 쓸 필요가 있다. 이것을 지원하는 것이 `NSDateFormatter`다.

####`NSDateFormatter` 사용법
```objc
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init]; //객체 생성
        dateFormatter.dateFormat = @"yyyy-MM-dd"; //원하는대로 포맷 설정
        NSDate *testBithday = [dateFormatter dateFromString:@"1988-01-31"]; //정한 포맷에 의거하여 생성, 만약 다른 포맷이 필요할 경우 포매터 다시 제작.
```