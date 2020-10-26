/* find the total sum of array of arrays using recursion*/


import Foundation
var initialArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
var finalSum = 0
var sum = 0
func findArrayOfArraySum(initialArray: [[Int]], count: Int) -> Int {
    
    for i in 0..<initialArray.count {
       
       finalSum += sumOfArray(initialArray: initialArray[i] , count: count)
    }

    //print(finalSum)    
    return finalSum
}
func sumOfArray(initialArray: [Int], count: Int) -> Int {
    
    if (count <= 0) {
        return 0
    }else {
      return sumOfArray(initialArray: initialArray , count: (count - 1)) + initialArray[count - 1]
    }
}


print(findArrayOfArraySum(initialArray: initialArray, count: initialArray.count))