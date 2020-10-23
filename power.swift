/*
Write a recursive function called power that takes a number x and an integer n and returns x^n.

Hint: A recursive definition of this operation is x^n = x · x^(n−1). Also, remember that anything raised to the zeroth power is 1.

Optional challenge: you can make this method more efficient, when n is even, using x^n = (x^(n/2))^2.

*/


import Foundation

func power(_ x: Int, _ n: Int) -> Int {
    
	if n == 0 {
        return 1
    }
    
	if (n%2 == 0){
         //print("via even")
        var m = power(x,n/2)
        return(m * m)
    } 
    else{
    //print("via odd")
    return ( x * power(x,n-1))
    }
}

print(power(2,10))