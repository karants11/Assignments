import Foundation
import Glibc

let mainDictionary = [
    "ABC001": [
        "Name": "ABC",
        "Age": 20,
        "Branch": "ECE",
        "Marks": [
            "Physics": 30,
            "Chemistry": 40,
            "Maths": 50
      ]
    ],
    "ABC002": [
        "Name": "DEF",
        "Age": 21,
        "Branch": "CS",
        "Marks": [
            "Physics": 31,
            "Chemistry": 41,
            "Maths": 51
]
    ],
    "ABC003":[
        "Name": "GHI",
        "Age": 22,
        "Branch": "IS",
        "Marks": [
            "Physics": 32,
            "Chemistry": 42,
            "Maths": 52
        ]
    ]

]
var valueToFind = "ABC001:Marks:Chemistry"
let keys = valueToFind.components(separatedBy: ":")
var dict: [String: Any] = mainDictionary
var result: Any?
var isFound: Bool = true

for key in keys {
	if let temp = dict[key] as? [String: Any] {
		dict = temp
	}else{
		if (dict.keys.contains(key)) {
			if let temp = dict[key] {
				result = temp
			}else{
				isFound = false
				break
			}
		}
	}
}

if let result = result {
print(result)
}


