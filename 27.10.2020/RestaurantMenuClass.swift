import Foundation
class RestaurantMenu {
    var breakFast: [String]
    var lunch: [String]
    var dinner: [String]
    var snacks: [String]
    var coldDrink: [String]
    init() {
        self.breakFast = ["Masaladosa", "Idli", "Rost", "Poori"]
        self.lunch = ["Full Meals", "Half Meals", "North Indian Thali","South Indian Thali"]
        self.dinner = ["chapathi", "Roti", "Meals"]
        self.snacks = ["VadaPav", "Bhel puri", "masala Puri", "Puffs"]
        self.coldDrink = ["sharjah Shake", "Chikku Shake"]
    }
    
    func setTiming(time: Int) {
        if( time < 11 && time > 00) {
            display(typeOfFood:breakFast)
        }else if (time >= 10 && time < 15) {
            display(typeOfFood: lunch)
        }else if (time >= 15 && time < 19) {
            display(typeOfFood: snacks)
        }else if (time >= 19 &&  time <= 24) {
            display(typeOfFood: dinner)
        }else{
            print("Enterd time is invalid enter HH in 24 hour format ")
        }
    }

    func display(typeOfFood: [String]) -> Void {
        for i in 0..<typeOfFood.count {
            print(typeOfFood[i])
        }
    }

}
var time = 9
let menu1 = RestaurantMenu()
menu1.setTiming(time: time)
