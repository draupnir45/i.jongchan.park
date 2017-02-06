# `UIButton`


 - `addTarget:Action:forControlEvents:`로 행동과 연결시킨다. Action 파라미터에는 `@selector(method:)`로 들어가며, 자동으로 버튼 객체 자신을 sender로 넘긴다.
 - 간단히 객체를 구분하거나 수치를 넘겨야 할 경우 `tag`라는 프로퍼티를 쓸 수 있지만, 서로 같은 값을 넣을 때는 쓰지 말 것. (tag는 다른 객체에도 있지만, 버튼액션에는 따로 파라미터를 넣을 수 없기 때문에 유용한 경우가 있다.)
 - 서브뷰 : `UILabel`과 `UIImageView`를 서브뷰로 올렸을 때 행동이 다르다. 레이블은 터치 이벤트를 받는 데 비해 이미지뷰는 받지 않고 가려버린다. 유저 인터랙션을 받도록 설정해도 똑같은 결과가 나온다.

- 기본적인 코드
```objc
        UIButton *myButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 100, 100)];
        [myButton setTitle:@"myButtonTitle" forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [myButton.layer setCornerRadius:15];
        [myButton setBackgroundColor:[UIColor blackColor]];
        [myButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [myButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [myButton addTarget:self 
        		 action:@selector(btnSelected:)
    forControlEvents:UIControlEventTouchUpInside];        
		[self.view addSubview:myButton];
```