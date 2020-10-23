//////Fermat

import Foundation

func checkFermat(_ a: Int,_ b:Int,_ c: Int,_ n:Int) {
    if(n > 2) {
        var lhs = (a ^ n + b ^ n)
        var rhs = c^n
        
		if lhs == rhs{
            print("Holy smokes, Fermat was wrong!")
        }
        else{
            print("No that doesn’t work.")
        }
    }
    else{
		print("\(n) is not grater than 2")
    } 
}

var n = 3
var a = 1
var b = 2
var c = 2

checkFermat(a,b,c,n)