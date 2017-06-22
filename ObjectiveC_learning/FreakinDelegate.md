# `Delegate`
> ### 컨텍스트를 알면 더 스마트해진다.

- `@protocol` : 통신규약... 이런 이름의 함수를 지원하여 나의 대리인이 되어라 깔깔깔
- `Delegate` : 대리인. Objective-C 객체가 프로퍼티로 가지고 있는 것. Objective-C에서 객체 간 통신 프로토콜을 구현하는 방식.
- `Class A`에 만들어진 `instance B`가 `Class A`의 메서드를 사용하기 위한 것.
- 즉 `UITextField`를 잘 쓰기 위해서 나의 클래스에 `UITextField`가 요구하는 `id <UITextFieldDelegate> delegate`가 되기 위한 `@protocol`을 맞추어 주어야 한다.
- 'call back' 역으로 호출되어 불리는 것.