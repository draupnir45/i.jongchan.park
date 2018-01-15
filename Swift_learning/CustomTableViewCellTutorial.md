# 커스텀 셀 만들기

```swift
import UIKit

class CustomCell: UITableViewCell {
  
}
```

## 기본 서브뷰들 만들기
```swift
import UIKit
import SnapKit

class CustomCell: UITableViewCell {

  // MARK: - Subviews

  let scrollBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.layer.cornerRadius = 10.0
    view.clipsToBounds = true
    return view
  }()
  
  let deleteButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
    return button
  }()
  
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isUserInteractionEnabled = false
    return scrollView
  }()
  
  let scrollContentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 10.0
    view.clipsToBounds = true
    return view
  }()
  
  let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.numberOfLines = 2
    return titleLabel
  }()
  
  static let smallLabelMaker: () -> UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    label.textColor = UIColor.gray333
    return label
  }
  
  let itemDateLabel: UILabel = CustomCell.smallLabelMaker()
  let optionLabel: UILabel = CustomCell.smallLabelMaker()
  let seatLabel: UILabel = CustomCell.smallLabelMaker()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
```

## Delegate 선언하기

```swift
weak var delegate: CustomCellDelegate?
```

```swift
protocol CustomCellDelegate: class {
  func customCellUserDidTapDelete(_ cell: CustomCell)
}
```

## 이니셜라이저

```swift
override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
  super.init(style: style, reuseIdentifier: reuseIdentifier)
  setSubviews()
}
  
required init?(coder aDecoder: NSCoder) {
  fatalError("init(coder:) has not been implemented")
}
```

```swift
func setSubviews() {
  //서브뷰 세팅...
}
```

## 서브뷰 세팅

```swift

```


```swift

```