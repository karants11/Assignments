// Assignment 1 Right justify using closure

import Foundation
let rightJustifyClosure = {
   (s: String) -> String
   in
   
   var spaceNeeded: String = ""
   var  strLen = 70 - s.length
   
   for _ in 0...strLen-1 {
       spaceNeeded += " "
   }
   
   return (spaceNeeded + s)

}

print(rightJustifyClosure("karan"))