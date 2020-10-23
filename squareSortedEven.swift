import Foundation
////sort-even-square-> In the list of numbers , square thr even element in sorted manner
// first check even then square last sort
var list = [1, 3, 5, 2, 6, 4, 8, 12, 14, 22, 10]
func sqareSortedEven(list: [Int], closure1: (Int) -> Bool, closure2: ([Int]) -> [Int]) -> [Int] {
    
    var finalList = [Int]()
    
    for i in 0..<list.count {
        if (closure1(list[i])) {
            finalList.append(list[i] * list[i])
        }    
    }
    
    finalList = closure2(finalList)
    
    return finalList
}


let isEven = { 
    $0 % 2 == 0 ? true: false

}

let sortListAscending = {
    (list: [Int]) -> [Int]
    in 

    var sortList = list
    
    for i in 0..<list.count {
        for j in 0..<list.count {
            if (sortList[i] < sortList[j]) {
                let tmp = sortList[i]
                sortList[i] = sortList[j]
                sortList[j] = tmp
            }
        }
    }
    return sortList
}


print(sqareSortedEven(list: list, closure1: isEven, closure2: sortListAscending))
