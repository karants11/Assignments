/*.
Write a recursive function named oddSum that takes a positive odd integer n and 
returns the sum of odd integers from 1 to n. Start with a base case, 
and use temporary variables to debug your solution. 
You might find it helpful to print the value of n each time oddSum is invoked.
*/

/////////////////////////////////
  
import Foundation

func oddSum(_ n: Int) -> Int {
    
	print("current value of n: \(n)")
    
	if n == 1{
        return 1
    }
    return (n + oddSum(n-2))
}

var n = 7
print("Odd sum of poitive integers till \(n) is \(oddSum(n))")
