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
        if let value = initialArrayOfDictionaries[i]["Name"] {
            finalArray.append(value)
        }
        if let value = initialArrayOfDictionaries[i]["Age"] {
            finalArray.append(value)
        }
        if let value = initialArrayOfDictionaries[i]["Branch"] {
            finalArray.append(value)
        }
    }

    return finalArray
}

let dictionaryToArray = arrayOfDictionariesToArray(initialArrayOfDictionaries: arrayOfDictionaries)

for value in dictionaryToArray {
    print(value)
}

