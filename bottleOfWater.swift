/*  The purpose of this exercise is to take a problem and break it into smaller problems, and to solve the smaller problems by writing simple functions.
Consider the first verse of the song “99 Bottles of water:

99 bottles of water on the wall,
99 bottles of water,
ya’ take one down, ya’ pass it around,
98 bottles of water on the wall.

Subsequent verses are identical except that the number of bottles gets smaller by one in each verse, until the last verse:

No bottles of water on the wall,
no bottles of water,
ya’ can’t take one down, ya’ can’t pass it around,
’cause there are no more bottles of water on the wall!


And then the song (finally) ends.*/

////////////////////////////////////////////////

import Foundation

func bottlesOfWater(_ xVerse: Int) {
var tmp =  xVerse

while tmp != 0 {
    
	print(" \(tmp) bottles of water on the wall,\n \(tmp) bottles of water,\n ya’ take one down, ya’ pass it around,")
    tmp -= 1
}

	print("No bottles of water on the wall, \n no bottles of water, \n ya’ can’t take one down, ya’ can’t pass it around, \n ’cause there are no more bottles of water on the wall!")
}

bottlesOfWater(5)