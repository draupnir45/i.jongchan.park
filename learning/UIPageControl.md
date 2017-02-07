#`UIPageControl`

- 스크롤 뷰 등 다른 뷰와 연동하여 페이지의 진행 상황을 알려주는 인디케이터를 띄우는 뷰 클래스.
- 전체 페이지수와 현재 페이지를 저장하며, 타겟과 액션을 이용해 스크롤을 역으로 컨트롤해줄 수 있다.

```objc
@property(nonatomic) NSInteger numberOfPages;          // default is 0
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

@property(nonatomic) BOOL hidesForSinglePage;          // hide the the indicator if there is only one page. default is NO

@property(nonatomic) BOOL defersCurrentPageDisplay;    // if set, clicking to a new page won't update the currently displayed page until -updateCurrentPageDisplay is called. default is NO
- (void)updateCurrentPageDisplay;                      // update page display to match the currentPage. ignored if defersCurrentPageDisplay is NO. setting the page value directly will update immediately

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;   // returns minimum size required to display dots for given page count. can be used to size control if page count could change


```