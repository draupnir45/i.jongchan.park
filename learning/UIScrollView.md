#`UIScrollView`

```
@property(nonatomic) CGPoint contentOffset; //컨텐트뷰가 보여지는 시작점을 가지고 있는 프로퍼티다. 기본은 0,0
@property(nonatomic) CGSize contentSize; //컨텐트뷰의 크기. 기본사이즈는 0,0
@property(nonatomic,getter=isPagingEnabled) BOOL          pagingEnabled __TVOS_PROHIBITED;//기본은 NO, 스크롤뷰의 가로세로의 배수fh contentOffset이 움직이도록 컨트롤함.

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  //새로운 스크롤 위치로 애니메이션하여 이동시킴.
```

`<UIScrollViewDelegate>`를 사용할 경우, 제스처를 받아서 결과값을 계산한 순간 다른 객체에 명령을 내릴 수 있다.