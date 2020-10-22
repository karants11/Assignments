// Assignment 1 Right justify

func rightJustify(s: String) {
   var spaceNeeded: String = ""
   var  strLen = 70 - s.length
    //print(strLen)
   for _ in 0...strLen-1 {
       spaceNeeded += " "
   }
   //print(spaceNeeded.length)
   print(spaceNeeded + s)

}
rightJustify(s: "karan")