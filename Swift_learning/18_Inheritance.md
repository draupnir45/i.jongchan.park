# 상속

기본적으로 Objective-C와 다르지 않습니다. 기본적인 내용과 특이한 내용만 정리합니다.

## 상속받아 쓸 수 있는 것
- 프로퍼티
- 서브스크립트
- 메서드

## Base Class
- 기반 클래스(Base Class) : 어떤 클래스도 상속받지 않은 클래스. NSObject도 상속받지 않아도 된다!

## 재정의 `override`
인스턴스 메서드, 타입 메서드, 인스턴스 프로퍼티, 타입 프로퍼티, 서브스크립트 등을 그대로 사용하지 않고 자신만의 기능으로 재정의가 가능.

### 메서드 재정의
- 필요가 있을 때 `override` 키워드를 붙여서 재정의 가능.

### 프로퍼티 재정의
- 저장 프로퍼티'로' 재정의는 불가!
- 가능한 것은 저장 -> 연산, 연산 -> 연산.
- 프로퍼티 감시자도 추가할 수는 있지만, 정확하게 말하면 재정의가 아니고 추가.
- 조상 클래스의 감시자도 작동함.

### 서브스크립트 재정의
- 메서드와 마찬가지. 매개변수와 반환 타입이 같을 때만 오버라이드로 취급.

### `final`키워드
- 클래스 그 자체, 프로퍼티, 클래스 메서드, 인스턴스 메서드, 서브스크립트 등 재정의가 가능한 모든 요소에 부여 가능.
- 이를 통해서 재정의를 방지한다.

## 클래스 이니셜라이저

### 지정 이니셜라이저
책임지고 초기화하는 이니셜라이저. 책임을 다하지 않은 상태에서는 아예 빌드가 안 된다. 책임이란 모든 non-optional 인스턴스 저장 프로퍼티의 초기화!

### 편의 이니셜라이저
편의 이니셜라이저는 자기 자신의 클래스의 다른 이니셜라이저를 꼭 부르게 되어 있다. 여기서 다른 이니셜라이저가 지정이든 편의든 상관없으나, 궁극적으로 지정 이니셜라이저를 거치지 않으면 안되게 되어 있다.

### 초기화 위임
세 가지 규칙을 기억하자!

[공식문서 with 일부의 번역](Two-Phase Initialization.md)

1. 자식 클래스의 지정 이니셜라이저는 부모 클래스의 지정 이니셜라이저를 반드시 호출. (부모 클래스의 편의 이니셜라이저를 호출하는 것은 불가능한 듯...?)
2. 편의 이니셜라이저는 의무적으로 자기 자신의 다른 이니셜라이저를 호출.
3. 그 길의 끝에서 궁극적으로 자기 자신의 지정 이니셜라이저가 호출.

그러니까 아무튼 뭐가 됐든 하나의 클래스는 그 지정 이니셜라이저가 호출되지 않으면 결코 초기화되지 않는다! 그게 규칙. 
