import Foundation

var arrayOfDictionaries = 
[
    [
      "Name": "ABC",
      "Age": 20,
      "Branch": "ECE"
    ],
    [
      "Name": "DEF",
      "Age": 21,
      "Branch": "CS"
    ],
    [
      "Name": "GHI",
      "Age": 22,
      "Branch": "IS"
    ]
]

func arrayOfDictionariesToArray(initialArrayOfDictionaries:[[String : Any]]) -> [Any] {
    var finalArray = [Any]()

    for i in 0..<initialArrayOfDictionaries.count {
        let keyArray = [String](initialArrayOfDictionaries[i].keys)

        if let value = initialArrayOfDictionaries[i][keyArray[0]] {
            finalArray.append(value)
        }
        if let value = initialArrayOfDictionaries[i][keyArray[1]] {
            finalArray.append(value)
        }
        if let value = initialArrayOfDictionaries[i][keyArray[2]] {
            finalArray.append(value)
        }
    }

    return finalArray
}

let dictionaryToArray = arrayOfDictionariesToArray(initialArrayOfDictionaries: arrayOfDictionaries)

for value in dictionaryToArray {
    print(value)
}

