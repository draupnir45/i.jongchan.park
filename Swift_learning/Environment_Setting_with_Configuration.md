# Configuration 이용하여 개발환경 세팅하기

[CocoaCast](https://cocoacasts.com/)라는 사이트의 [Switching Environments With Configurations](https://cocoacasts.com/switching-environments-with-configurations/)라는 포스트를 참고하여 개발환경을 세팅해봤는데요. 관련해서 핵심이 되는 사항을 정리했습니다.


## 용어 정리
- **Configuration** - 빌드 세팅의 집합체. 기본적으로 Debug와 Release 두 가지가 제공된다.
- **Scheme** - 어떤 컨피겨레이션과 어떤 타겟을 통해 빌드할 것인지를 나타내는 설계도.

## 왜 필요한가?
웹 서비스와 연동하는 클라이언트는 일상적으로 연동 테스트를 수행합니다. 서버 사이드도 개발(테스트+디버그) 용의 서버를 따로 만들게 되고, 클라이언트의 경우 최초에 개발 서버와 먼저 테스트한 후, 실 서버에 내용이 반영되면 실 서버와도 테스트를 해야 합니다. 모든 테스트가 완료되어야 출시가 가능하겠죠? 정리하면 아래와 같습니다.

   - 개발서버 ↔︎ 클라이언트(Debug)
   - 실서버 ↔︎ 클라이언트(Debug)
   - 실서버 ↔︎ 클라이언트(Release, 테스트는 아니고 아카이브용)

가장 간단한 방법은 그냥 여러 개의 URL 스트링을 프로젝트에 넣어 놓고 하나를 주석 처리해놓고 쓰는 방법입니다. 하지만 당연히도 간단한 만큼 번거롭고 번거롭기에 실수가 생길 가능성이 높습니다. 최악의 경우 개발 서버를 바라보고 있는 클라이언트가 앱 스토어에 출시되는 최악의 실수가 벌어질 수도 있습니다.

실수를 방지하고 개발 환경을 쉽게 전환하면서 테스트하기 위해 'Configuaration'을 활용해 보도록 하겠습니다. XCode 프로젝트를 만들면 기본으로 Debug와 Release 이렇게 두 개의 Configuration이 제공됩니다. 말 그대로 하나는 개발과 디버그 용이고 다른 하나는 실제 배포용이죠. 제 목표는 2가지입니다.

1. Debug Configuration을 이용해 개발 서버, 실 서버 테스트를 간단하게 스위칭할 수 있도록 할 것.
2. Archive시 절대 개발 서버의 API를 바라보는 실수가 없도록 할 것.

## 방법
말은 거창하지만 생각보다 어려운 일은 아닙니다.

### 1. Configuration 추가
먼저 프로젝트를 열고, Project → Info 탭 → Configuration 에서 `+` 버튼을 누릅니다. 그리고 'Duplicate "Debug" Configuration'을 선택합니다. (릴리즈용은 릴리즈때만 쓰는 걸로 하고...)

이렇게 하면, 이름만 다른 새로운 Configuration을 만들 수 있습니다. 저는 이렇게 복사한 Configuration을 실서버 테스트용으로, 기존에 있는 걸 개발서버 테스트용으로 쓰고자 합니다. 그래서 아래와 같이 설정해 주었어요.

![](images/Configuration-1.png)

### 2. Scheme 추가
이제 만든 Configuration을 바탕으로 빌드하는 Scheme를 만들어야 합니다. 상단 플레이와 정지 버튼 옆에 있는 앱 아이콘 모양을 클릭하면 'Manage Scheme'라는 메뉴가 있습니다. 들어가서 복사하고자 하는 스키마를 선택한 후 하단의 톱니바퀴를 눌러 복사합니다. 제 경우는 Debug를 복사했습니다. 이름을 바꾸고, Info 탭에서 Configuration을 아까 넣었던 'Debug:Production'으로 바꾸어 줍니다.

여기까지 하면 'Debug'의 Scheme와 Configuration을 그대로 가진 'Debug:Production'가 만들어진 것입니다.

### 3. Info.plist를 이용해서 Configuration 불러오기.

Info.plist에 아래와 같은 항목을 입력해 줍니다.

```xml
<key>Configuration</key>
<string>$(CONFIGURATION)</string>
```

이렇게 하면 프로젝트 내 스위프트 파일에서 아래와 같이 Configuration을 불러올 수 있습니다.

```swift
Bundle.main.object(forInfoDictionaryKey: "Configuration") //Configuration이름을 String으로 반환.
```

### 4. 실서버와 개발 서버 아이디 연동

이제는 쉽죠!

```swift
static func apiURL(_ path: Path) -> String {
	//현재의 빌드 모드에 따라 적절한 URL을 반환
	let baseURL: String
	switch SchemeMode.current {
	case .debug:
	  baseURL = BaseURL.dev
	case . debugPrd, .release:
	  baseURL = BaseURL.release
	}
	    
	return baseURL + APIversion + path.rawValue
}
```


## 정리

이런 구성은 처음 해보는 거라, 공부하면서 만들어 봤습니다. 서버 변경을 빈번하게 하면서 디버그할 때 유용할 거 같아요.