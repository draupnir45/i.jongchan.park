# 복사와 참조의 정당성에 대해

## `struct`와 `class`
Swift에서는 구조체도 메서드를 정의하고 사용할 수 있습니다. 사용하는 과정만 보면 구조체나 클래스나 크게 다를 것이 없어 보입니다. 

```swift
struct PersonStruct {
    let id: Int
    let name: String
    var age: Int
}

class PersonClass {
    let id: Int
    let name: String
    var age: Int
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}


let structPerson: PersonStruct = PersonStruct.init(id: 1, name: "Steve", age: 20)
let classPerson: PersonClass = PersonClass.init(id: 1, name: "Steve", age: 20)

print(structPerson.name)
print(classPerson.name)
```
보통은 이런 정도의 복잡성만 띄는 경우가 많기 때문에, 무얼 써야 할지 애매한 경우가 많습니다. 

저도 그래서 최대한 struct를 쓰려는 경향으로만 해 오고 있었는데, 이렇게 되니까 그냥 데이터모델은 죄다 구조체로만 만들어지더라구요. 

>#### 구조체를 써야 하는 경우
- 연관값을 간단히 캡슐화할 때
- 캡슐화된 값이 의미상 참조가 아니라 복사되어야 합당할 때
- 저장될 프로퍼티가 값이며 참조보다 복사가 합당할 때
- 상속받을 필요가 없을 때

그런데 생각해보니, 보통 어레이에 담겨서 이리저리 휩쓸려 다니는 데이터모델은 클래스로 하는 게 낫겠더라구요. 보통은 참조가 더 합당한 경우가 많으니까...아래처럼요

```swift
var structArray: [PersonStruct] = [PersonStruct.init(id: 1, name: "Steve", age: 20), PersonStruct.init(id: 2, name: "Jongchan", age: 21), PersonStruct.init(id: 3, name: "Jony", age: 22)]
let jobsStruct: PersonStruct = structArray[0]

structArray[0].name = "Jobs"
print(structArray[0].name)
print(jobsStruct.name, "중요")

var classArray: [PersonClass] = [PersonClass.init(id: 1, name: "Steve", age: 20), PersonClass.init(id: 2, name: "Jongchan", age: 21), PersonClass.init(id: 3, name: "Jony", age: 22)]
var jobsClass: PersonClass = classArray[0]

classArray[0].name = "Jobs"
print(classArray[0].name)
print(jobsClass.name, "중요")

```

이런 식이면 대체 구조체는 언제 쓰나 싶어지네요. 그래서 생각해 보니

```swift
struct UserPostDataKeys {
    static let userId: String = "user_id"
    static let userName: String = "user_name"
    static let contentDictionary: String = "content"
    static let writtenDate: String = "creation_date"
}
```

이런 경우는 있더라구요. 그것도 근데 사실 좀 모아주는 의미 이외에는, 그냥 전역 상수에 다름이 아니죠.

그럼 대체 구조체는 어디다 쓰는 걸까요?

복사되어야 합당한 내용의 프로퍼티를 캡슐화해야 되는 경우가 무엇일까요. 생각해보면 IndexPath같은 녀석이 있습니다. 이 녀석은 추상적인 개념입니다. 그냥 그런 개념이 존재하는 것이고, 개념 그자체에 수정을 가할 수가 없는 놈입니다. 그러면서도 한 번에 하나씩 찾아다 쓰기엔 애매하죠. 날짜(Date)도 그렇습니다. 그래서 구조체고요. (전에는 참조였죠.)

그런 게 뭐가 있을까요??

그러니까 로직상 추상적으로 필요한 비빌 언덕 같은 놈인데.... 으으으으으으으

어렵네요. 공식 문서를 보면

>- 기하학적 형태의 사이즈. 너비나 높이 등의 캡슐화가 될 수 있음.
- 연속적인 것의 범위를 나타낼 때. 시작점과 길이 등의 캡슐화가 될 수 있음.
- 3D 위치를 나타내는 포인트. 가로위치, 세로위치, 깊이 등의 캡슐화가 될 수 있음.

그러니까 꽤나 복잡한 상황을 전제하고 있는 겁니다. 추상적인 개념이 묶여야 하고, 그걸 이용해서 컨트롤해줘야 하는 거죠.