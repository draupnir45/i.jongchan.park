#`UIView`

모든 뷰의 아버지

- `CGFrame frame` : 뷰를 그리기 위해서 필요한 프로퍼티. `CGPoint origin(x,y)`와 `CGSize size(width, height)`로 이루어져 있으며, 늘 뷰 생성시에 부여해주어야 한다. 역으로 이미 나오고 있는 모든 뷰에는 프레임이 있어서, 불러올 수 있다.
- `setCenter:(CGPoint)` : 중간값을 읽고 쓸 수 있다. 쓰게 되면 뷰의 위치가 바뀌며, 애니메이션도 가능.