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

#### Swift의 기본타입 아카이브
- NSCoding
- JSON
- Property lists

	```swift
	enum Animal : Codable {	case chicken	case cow	case sheep 
	}
	
	struct Farm : Codable {    let name: String    let animals: [Animal]	}
	
	```

