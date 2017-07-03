# UICollectionView

## 기본
- 뷰 띄우는 과정은 기본적으로 UITableView와 동일.
- 커스텀 방식도 동일

## 헤더와 푸터
- 헤더와 푸터를 띄워주기 위해 `UICollectionReusableView`라는 것을 사용.
- DataSource 메서드 예시

```swift
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView: MyCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyCollectionReusableView.reuseID, for: indexPath) as! MyCollectionReusableView
    //reusableView 설정
    reusableView.headerTitleLabel.text = "Header Supplementary View"
    return reusableView
}
```