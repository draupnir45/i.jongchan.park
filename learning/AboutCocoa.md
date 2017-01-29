#Cocoa에 대하여

Cocoa와 Cocoa Touch는 각각 macOS와 iOS를 개발하기 위한 프레임워크입니다.
공통적으로 Foundation이라는 프레임워크를 가지고 있고, 각 UI특성에 따라 'AppKit'과 'UIKit'으로 인터페이스를 꾸밀 수 있도록 지원합니다.

##Foundation
Objective-C의 기초를 이루는 프레임워크로, 모든 오브젝트의 상위 오브젝트인 NSObject, 그리고 기본적인 숫자, 문자열, 그리고 컬렉션 등의 기능을 모두 포함하고 있습니다. NSInteger, NSString, NSArray 등이 이 프레임워크에 기초합니다.

###루트 클래스 (NSObject)
모든 Objective-C의 클래스의 최종적인 부모 클래스입니다. Objective-C는 객체 지향 언어이고, 이 객체들이 살아 움직이는 시공간을 만들어내는 것이 바로 Objective-C 런타임입니다. 이 런타임과 직접적으로 이야기하는 단 하나의 클래스가 NSObject인 것입니다.

그래서 NSObject는 자기검사(introspection), 메모리관리(memory management), 메서드 발동 등을 포함하는 가장 기본적인 활동을 지원합니다. 이후 자신으로부터 상속한 모든 클래스의 객체들이 어엿한 NSObject로써 활동할 수 있도록 말입니다. 

####자기검사(introspection)
런타임 동안 각각의 객체에게 자기 자신의 특성을 물어볼 수 있는 특성을 말합니다. 자신이 어떤 클래스로부터 만들어진 객체인지 혹은 특정 메서드를 가지고 있는지 등등의 정보를 말이죠. 

- `isKindOfClass:` : 자신이 어떤 클래스의 특성을 직접적 혹은 간접적으로 물려받았는지 여부(Bool)를 리턴합니다. (따라서 모든 객체에게 isKindOfClass:NSObject 를 물으면 YES가 돌아옵니다.)
- `isMemberOfClass:` : 해당 객체가 특정 클래스의 객체인지를 물어봅니다. 상속 관계와 상관없이, 정확히 적시한 그 클래스여야만 합니다. 
- `respondsToSelector:` : 해당 객체가 특정 메서드를 실행할 수 있는지를 묻습니다. 역시 Bool값을 리턴합니다.
- `conformsToProtocol: ` : 해당 객체가 특정 프로토콜을 따르는지 문의하고, Bool값을 반환합니다.

####메모리관리(memory management)