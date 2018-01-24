# UIKit, 안다고 생각했던 것들에 대하여 - 1

요즘 부쩍, 예전에 공부하면서 몰랐던 API들을 알게 됩니다. 괜히 어렵게 처리하고, 심지어는 학원 조교 시절에는 안답시고 대답하고 설명까지 했던 것들을 사실 알고 보니 아주 간단하게 할 수 있었던 것들. 이런 것이 보일 때마다 어디 숨고 싶네요. 나는 API를 제대로 보지도 않은 채 무조건 임기응변을 쓰거나 커스텀부터 하려 한 것은 아닐까 하는 생각도 들구요. 앞으로 이런 것들이 적당히 쌓일 때마다 포스팅을 해 놓으려고 합니다.

### UIStackView의 layoutMargins

- UIEdgeInsets를 넣으면 스택뷰 내부의 정렬된 뷰들로부터 마진을 잡아 줍니다.

    ```swift
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins.bottom = 16.0
    ```

- 스택뷰는 arrangedSubview들 사이에서 공간을 잡아 주는 spcing이라는 녀석이 있죠. 그 녀석과 비슷하거나 조금 더 큰 마진을 테두리에 주기 위해 막 컨테이너로 감싸고 난리친 코드가 산더미 같습니다. 실은 저 두 줄과 alignment만 잘 이용해도 다 할 수 있는 거였는데... 마음이 아프네요 ㅜㅠ

### UITableViewCell의 prepareForReuse()

- tableView로부터 dequeue될 때 불리는 함수입니다.
- 먼젓번 셀에서 넣었던 컨텐츠들을 없애 주는 데 유용합니다.

    ```swift
    override func prepareForReuse() {
      super.prepareForReuse()
      self.isAvailable = true
    }
    ```
    
- 어휴 이 문제를 없애겠다고 tableView(_ tableView:, cellForRowAt indexPath:)에서 막 디큐한 거에 빈걸 넣고 어휴... ㅠㅜ 처음 발견했을 때 어떻게 지금까지 몰랐나 싶었습니다..

### UIButton 만들기 전에... 잊지말자 UIControl
- UIButton을 touchUpInside만 사용하고 기본 프로퍼티들을 사용하지 않을 거라면, 굳이 버튼을 쓸 이유가 없습니다. UIView를 커스텀해서 막 투명한 걸 올리고 그럴 이유도 하나도 없죠. 버튼이 뭐 시스템이네 아니네 고민할 필요도 없습니다. 그냥 UIControl을 쓰면 됩니다. UIControl도 UIView니까요.
- 괜히 UIButton으로 만들어 가지고 시스템이라 글자색이 변하네 안 변하네 안에 있는 이미지뷰 정렬하려고 컨텐트 인셋을 이상하게 만지지 않나 아주 말도 안 되는 걸 하고 있었습니다. 바로 최근까지도 Button 커스텀을 위해 UIView를 사용했었네요...ㅜ