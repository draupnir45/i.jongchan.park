# What's New In Cocoa Touch 2017
- 2017년 WWDC에서 Cocoa Touch 프레임워크와 스위프트에 새롭게 추가된 것들을 이야기하는 세션인 "What's New In Cocoa Touch 2017"를 보고 나름대로 정리해 보았습니다. 
- [WWDC 세션 영상](https://developer.apple.com/videos/play/wwdc2017/201/)

## 1. Productivity
### Drag & Drop
- 이번 iOS 업데이트는 상당히 특이한 업데이트였는데요. iPhone에 대해서는 몇몇 UI 수정사항을 제외하고는 크게 사용성이 변화할 정도의 것은 없었던 데 반해, 아이패드는 완전히 새로운 기기로 만들어 버렸습니다. 그 중 하나가 단연 "File"이라는 앱과 "Drag & Drop" 기능이었습니다. 그것을 적용하는 방식을 소개하고 있었습니다.
- `UIDragInteraction` : 적용할 아이템에 넣어버리기.

	```swift
	let drag = UIDragInteraction(delegate: self)
	iconView.addInteraction(drag)
	```
	
	- 데이터 넘기기
	- 들어올리는 애니메이션 커스텀
	- 미리보기 커스텀 등이 가능.

- `UIDropInteraction` : 드롭할 컨테이너에 넣어버리기.

	```swift
	let drop = UIDropInteraction(delegate: self)
	iconContainerView.addInteraction(drop)
	```

	- 드래그함에 따른 UI 업데이트
	- 데이터 받음
	- 드롭하는 애니메이션 커스텀

- 기본적용 (Built-in support) : 테이블뷰, 컬렉션뷰, 텍스트뷰, 텍스트필드, 웹뷰

### File Management
- 역시나 "File" 앱과 관련된 업데이트입니다.
- `UIDocumentBrowserViewController`라는 새로운 뷰컨트롤러가 등장했는데요. 특정 컨텐트타입에 대해 열어볼 수 있는 이니셜라이저를 제공하네요. 추후에 직접 해보고 포스팅하겠습니다.

	```swift
	class UIDocumentBrowserViewController {
		init(forOpeningFilesWithContentTypes: [String]?)		var delegate: UIDocumentBrowserViewControllerDelegate?
	}
	```

## 2. UI Refinement
지난 음악 앱부터 페이지 제목을 볼드하게 나타내는 스타일을 도입했는데요. iOS 네비게이션의 근간인 `UINavigationController`에 기본으로 해당 옵션이 포함되었습니다. 이제 그 스타일이 iOS 전반으로 퍼지게 될 것으로 보입니다. 또한 기존에 수정이나 삭제 등만 제한적으로 사용되던 스와이프 액션을 훨씬 여러 가지 용도로, 또한 직관적으로 사용할 수 있게 되었습니다.

### Navigation Controller 관련
- `navigationController.navigationBar.prefersLargeTitles` : 큰 타이틀을 사용할 것인가를 네비게이션 컨트롤러의 네비게이션 바에게 지정. (IBDesignable)
- `self.navigationItem.largeTitleDisplayMode` : 해당 네비게이션 바를 받는 뷰컨트롤러들이 각각이 자신의 타이틀을 어쩔건지 판단. (IBDesignable)

### Swipe Action 관련
- TableView 경우 : UITableViewDelegate 메서드에서 활용.

	```swift
	func tableView(_: , trailingSwipeActionsConfigurationForRowAt:) -> UISwipeActionsConfiguration? //뒤에서
	func tableView(_: , leadingSwipeActionsConfigurationForRowAt:) -> UISwipeActionsConfiguration? //앞에서
	```

- 백견이 불여일RUN

	```swift
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualDeleteAction: UIContextualAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "delete") { (action, view, handler) in
            
            self.dataArray?.remove(at: indexPath.row)
            handler(true)
            
        }
        
        let contextualEditAction: UIContextualAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "make 100") { (action, view, handler) in
            
            self.dataArray?[indexPath.row] = 100
            tableView.cellForRow(at: indexPath)?.textLabel?.text = "100이 됐다!!"
            handler(true)
            
        }

        return UISwipeActionsConfiguration(actions: [contextualDeleteAction, contextualEditAction])
    }
	```


## 3.API enhancements

### Swift 4 & Foundation 관련
오랜 숙제를 해결했습니다. 그 동안 NS-콜렉션에게 의존해야 했던 아카이브 기능을 기본 타입이 지원할 수 있도록 해줍니다. 빨리 써보고 싶네요.

#### 1. Swift의 기본타입 아카이브
- NSCoding
- JSON
- Property lists

	```swift
	enum Animal : Codable {	case chicken	case cow	case sheep 
	}
	
	struct Farm : Codable {    let name: String    let animals: [Animal]	}
	
	```

#### 2. KeyPath 타입
- 점표기법으로 찾아가는 패스를 타입으로 저장이 가능.

	```swift
	let copresenterNameKeyPath = \Presenter.copresenter.name
	eliza[keyPath: copresenterNameKeyPath]  // “Josh”
	eliza[keyPath: \.copresenter.name]      // “Josh”
	```

### 시스템 제스처 구분
- 원래는 화면 하단에서 스와이프 업 해서 컨트롤 센터에 넘어가는 행동을 스테이터스바가 있고 없음에 따라 컨트롤했습니다. 이것을 아래 메서드를 통해 명시적으로 컨트롤이 가능해졌다고 합니다.

	```swift
	class UIViewController {
		func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge
	}
	```

### 오토 레이아웃 - 스크롤 뷰
- 기존 스크롤뷰 오토 레이아웃의 경우 스크롤뷰가 추측해서 행동했는데, 새로운 가이드 프로퍼티를 추가해서 좀더 편하게 레이아웃을 잡을 수 있도록 지원합니다.

	```swift
	class UIScrollView {
		var contentLayoutGuide: UILayoutGuide { get }
		var frameLayoutGuide: UILayoutGuide { get }
	}
	```

### 다이나믹 타입 지원
- 다이나믹 타입을 커스텀 폰트에도 쉽게 적용할 수 있도록 지원합니다.

	```swift
	//원래 하던 방식
	let bodyFont = UIFont.preferredFont(forTextStyle: .body)
	let titleFont = UIFont.preferredFont(forTextStyle: .title1)
	
	//새로운 방식
	let bodyMetrics = UIFontMetrics(forTextStyle: .body)
	let standardFont = ... // any font you want, for standard type size
	let font = bodyMetrics.scaledFont(for: standardFont)
	
	//레이아웃용 사이즈들에도 적용이 가능
	let titleMetrics = UIFontMetrics(forTextStyle: .title3)
	let standardHeight = ... // button height for standard type size
	let height = titleMetrics.scaledValue(forValue: standardHeight)
	```

- 오토 레이아웃시 베이스라인을 기준으로 스페이싱이 적용 가능합니다.

	```swift
	let topAnchor = topLabel.lastBaselineAnchor
	let bottomAnchor = bottomLabel.firstBaselineAnchor
	bottomAnchor.constraintEqualToSystemSpacing(below: topAnchor)
	```

	- VFL 적용. (??다시 공부가 필요.)
	
		```swift
		NSLayoutConstraints.constraintsWithVisualFormat(	“V:|-[topLabel]-[bottomLabel]-|”,    
			// ‘-‘ gives you system spacing	options: [spacingBaselineToBaseline],	metrics: nil,	views: ...)
		```
	
	- 스택뷰 적용
	
		```swift
		stackView.baselineRelativeArrangement = true
		stackView.spacing = .spacingUseSystem
		```
		
### Password AutoFill
- Thank God.
- [Session](https://developer.apple.com/videos/play/wwdc2017/206/)


### Asset Catalogs
- 에셋 카탈로그가 컬러를 지원하도록 바뀌었습니다. 기존에 확장으로 써야 하는 것을 에셋으로 쓸 수 있게 됨에 따라, IB에서도 좀 더 쉽게 컬러 스키마를 적용할 수 있을 것으로 보입니다. 이후 제플린 등에도 관련된 기능 업데이트가 적용될지 궁금합니다.

	```swift
	UIColor(named:"SomeColor")
	```

- Preserve Vector Data : 정확하게 이해가 되지는 않지만, 아마도 이미지를 자동으로 압축을 하는 기능이 있는 듯 합니다. 그 기능을 좀더 디테일하게 컨트롤할 수 있는 것으로 보입니다.

### ProMotion
- 이번 iPad Pro 라인업은 ProMotion이라는 높은 프레임 레이트의 디스플레이를 탑재했습니다. 해당 기능을 활용할 수 있도록 하는 프로퍼티가 공개되었습니다.

	```swift
	class UIScreen {
		var maximumFramesPerSecond: Int { get }	}
	```
	
- 인스트루먼트로 테스트!
- Metal에서도 활용. 잘 모르겠어요.

## Localization
- 아랍어 등은 좌측에서 우측으로 글을 쓰지 않고 우측에서 좌측으로 글을 쓴다고 합니다. 그런 경우는 UI의 하이어라키가 반대가 되는 것이 자연스럽습니다.
- [가이드](https://developer.apple.com/internationalization/)
- [한글 가이드](https://developer.apple.com/kr/internationalization/)