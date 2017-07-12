//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
    
    mutating func reverse(direction: Direction) {
        var bufferMatrix:SudokuMatrix = SudokuMatrix(numberArray: self.numberArray)
        
        switch direction {
        case .row:
            self[row: 1] = bufferMatrix[row: 3]
            self[row: 3] = bufferMatrix[row: 1]
        case .col:
            self[col: 1] = bufferMatrix[col: 3]
            self[col: 3] = bufferMatrix[col: 1]
            
        }
    }
    
    func printMatrix() {
        
        print(self[row:1])
        print(self[row:2])
        print(self[row:3], "\n")
        
    }
}

enum Direction {
    case row
    case col
}

var array: [Int] = Array(1...9)
var randomArray: [Int] = []
for _ in 0...8 {
    let randomIndex: Int = Int(arc4random_uniform(UInt32(array.count)))
    randomArray.append(array.remove(at: randomIndex))
}

var matrix: SudokuMatrix = SudokuMatrix.init(numberArray: randomArray)


matrix.printMatrix()

print("1행(row1)에 접근", matrix[row: 1])
print("1열(col1)에 접근", matrix[col: 1], "\n")

matrix[row: 2]

matrix.reverse(direction: Direction.row)
matrix.reverse(direction: Direction.col)

print("Reversed!")
matrix.printMatrix()
