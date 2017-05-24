# Swift와 객체 지향 프로그래밍

## 특징
- 클래스뿐만 아니라 구조체도 객체 지향 스타일로 활용.
- 하나의 소스 파일 안에서 여러 개의 클래스나 구조체를 선언할 수 있으며, 중첩해서 클래스 안에 클래스, 구조체 안에 구조체를 중첩해서 정의하고 선언할 수도 있습니다.

## 구조체 정의
- 타입이므로 대문자 카멜케이스 적용
- memberwise initializer : 구조체의 프로퍼티 이름으로 자동으로 init 메서드가 생성됨.

	```swift
	struct YourStructName {
	    var someProperty: String
	    
	    mutating func someMethod(someParam: String) -> Void {
	        someProperty = someParam
	    }
	    
	}
	
	//init 메서드가 자동으로 생성
	var structInstance: YourStructName = YourStructName.init(someProperty: "Hey!")
	
	//내부에서 var로 프로퍼트를 지정한다 해도 인스턴스가 let이면 변경불가
	structInstance.someMethod(someParam: "Wow!")
	
	
	```
	
## 클래스 정의
- 부모 클래스 없이 단독으로 정의가 가능. (PONSO 같은 느낌?)
- 역시 대문자 카멜케이스.

	```swift
	class ParentClass {
	    var lastName: String = "홍"
	}
	
	class Person: ParentClass {
	    var firstName: String = "길동"
	    
	    func changeMyLastName(to newLastName: String) -> Void {
	        print("에잇 내가 성을 간다.")
	        self.lastName = newLastName
	    }    
	}
	
	extension Person: CustomStringConvertible {
	    var description: String {
	        return "내 이름은 \(lastName)\(firstName)입니다."
	    }
	}
	
	
	let gildong: Person = Person.init()
	
	print(gildong)
	
	//클래스의 인스턴스는 레퍼런스 타입이므로, let으로 정의해도 프로퍼티 자체가 var이면 다른 값을 할당 가능.
	gildong.changeMyLastName(to: "김")
	print(gildong)
	
	gildong.firstName = "동길"
	print(gildong)
	
	```
	
	
## 공통점
- 프로퍼티와 메서드를 가질 수 있음
- 서브스크립트 문법을 통해 값에 접근할 수 있게 함
- 이니셜라이저 정의가 가능
- 익스텐션을 통해 확장기능 구현 가능
- 프로토콜 준수도 가능

## 클래스에서만 되는 것 혹은 클래스가 남아 있는 이유 혹은 클래스로 만들어야 하는 객체의 구별법
- 상속
- 타입 캐스팅

	```swift
	class MediaItem {
	    var name: String
	    init(name: String) {
	        self.name = name
	    }
	}
	
	class Movie: MediaItem {
	    var director: String
	    init(name: String, director: String) {
	        self.director = director
	        super.init(name: name)
	    }
	}
	
	class Song: MediaItem {
	    var artist: String
	    init(name: String, artist: String) {
	        self.artist = artist
	        super.init(name: name)
	    }
	}
	
	let library: [MediaItem] = [
	    Movie(name: "Casablanca", director: "Michael Curtiz"),
	    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
	    Movie(name: "Citizen Kane", director: "Orson Welles"),
	    Song(name: "The One And Only", artist: "Chesney Hawkes"),
	    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
	]
	
	for item in library {
	    if let movie = item as? Movie {
	        print("Movie: \(movie.name), dir. \(movie.director)")
	    } else if let song = item as? Song {
	        print("Song: \(song.name), by \(song.artist)")
	    }
	}
	```
	
- 디이니셜라이저
- Reference Counting

## 구조체를 써야 하는 경우
- 연관값을 간단히 켭슐화할 때
- 캡슐화된 값이 의미상 참조가 아니라 복사되어야 합당할 때
- 저장될 프로퍼티가 값이며 참조보다 복사가 합당할 때
- 상속받을 필요가 없을 때

