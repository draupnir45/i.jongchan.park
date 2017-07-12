# 서브스크립트

## 정의

> Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence.
> 
> 번역 - 클래스, 구조체, 열거형 등에서 해당 타입이 가진 컬렉션이나 리스트, 시퀀스(일련의 연속된 데이터) 등을 접근할 수 있는 단축경로인 서브스크립트를 정의할 수 있습니다. 

> 다음에서 발췌: Apple Inc. ‘The Swift Programming Language (Swift 3.1).’ iBooks. 


### 구현 예시

- 3x3의 행렬에 행과 열을 이용해 불러오는 예시.

	```swift
	struct SudokuMatrix {
	    var numberArray: [Int] = Array(repeating: 0, count: 9)
	    
	    func index(from row: Int, _ column: Int) -> Int {
	        return (row - 1) * 3 + column - 1
	    }
	    
	    subscript (row:Int, column:Int) -> Int {
	        get {
	            let index = self.index(from: row, column)
	            return numberArray[index]
	        }
	        set {
	            let index = self.index(from: row, column)
	            numberArray[index] = newValue
	        }
	    }
	    
	    subscript(row row:Int) -> [Int] {
	        get {
	            let rowStart: Int = (row - 1) * 3
	            return Array(numberArray[rowStart...rowStart + 2])
	        }
	        set {
	            let rowStart: Int = (row - 1) * 3
	            self.numberArray.replaceSubrange(rowStart...rowStart + 2, with: newValue)
	        }
	    }
	    
	    subscript(col col:Int) -> [Int] {
	        get {
	            let colStart: Int = col - 1
	            return [numberArray[colStart], numberArray[colStart + 3], numberArray[colStart + 6]]
	        }
	        set {
	            let colStart: Int = col - 1
	            self.numberArray[colStart] = newValue[0]
	            self.numberArray[colStart + 3] = newValue[1]
	            self.numberArray[colStart + 6] = newValue[2]
	        }
	    }
	}
	```


### 용례
 - 그냥 쓰면 된다.

	```swift
	print("1행(row1)에 접근", matrix[row: 1])
	print("1열(col1)에 접근", matrix[col: 1], "\n")
	//1행(row1)에 접근 [3, 1, 7]
	//1열(col1)에 접근 [3, 2, 4] 
	```