# Crashlytics 사용법 정리

## 개요
Crashlytics는 모바일 앱에서 발생한 크래시를 개발자가 알 수 있도록 해 주는 솔루션입니다. (언어 : Swift)

## 사용법
CocoaPods을 통해 설치합니다.

### Kit를 프로젝트에 추가하기

```
// Podfile
pod 'Fabric'
pod 'Crashlytics'

// Run Script Build Phase
"${PODS_ROOT}/Fabric/run" ##################API KEY################

// Info.plist
<key>Fabric</key>
<dict>
	<key>APIKey</key>
		<string>##################API KEY################</string>
	<key>Kits</key>
		<array>
		<dict>
			<key>KitInfo</key>
			<dict/>
			<key>KitName</key>
			<string>Crashlytics</string>
		</dict>
		</array>
</dict>
```

### Crashlytics 초기화
- AppDelegate에 아래와 같이 초기화해줍니다.

```swift
import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {   
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        return true
    }
}
```
- 이렇게 세팅한 앱이 크래시가 나면 해당 인스턴스의 타입 / 라인 / 메서드명을 알려줍니다.

```swift
ViewController.swift line 30
ViewController.crashButtonTapped(AnyObject) -> ()
```

