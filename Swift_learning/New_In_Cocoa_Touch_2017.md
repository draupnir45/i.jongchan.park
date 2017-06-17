# What's New In Cocoa Touch 2017
- [WWDC 세션 영상](https://developer.apple.com/videos/play/wwdc2017/201/)

## Productivity (연습해볼 것)
### Drag & Drop

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

- 새로운 뷰컨트롤러 종류가 등장.

	```swift
	class UIDocumentBrowserViewController {
		init(forOpeningFilesWithContentTypes: [String]?)	var delegate: UIDocumentBrowserViewControllerDelegate?}
	```

## UI Refinement
모두가 11부터만 가능.

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


## API enhancements

### Swift 4 & Foundation 관련

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
- 원래는 화면 하단에서 스와이프 업 해서 컨트롤 센터에 넘어가는 행동을 스테이터스바가 있고 없음에 따라 컨트롤했습니다. 이것을 아래 메서드를 통해 명시적으로 컨트롤 가능.

	```swift
	class UIViewController {
		func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge
	}
	```

### 오토 레이아웃 - 스크롤 뷰
- 기존 스크롤뷰 오토 레이아웃의 경우 스크롤뷰가 추측해서 행동했는데, 새로운 가이드 프로퍼티를 추가해서 좀더 편하게 레이아웃을 잡을 수 있도록 지원.

	```swift
	class UIScrollView {
		var contentLayoutGuide: UILayoutGuide { get }
		var frameLayoutGuide: UILayoutGuide { get }
	}
	```

### 다이나믹 타입 지원
- 다이나믹 타입을 커스텀 폰트에도 쉽게 적용할 수 있도록 지원

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

- 오토 레이아웃시 베이스라인을 기준으로 스페이싱이 적용 가능

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
		
