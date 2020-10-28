/* class in swift

///////////////////////////

1) class of car

*/

import Foundation
class Car {
    let model: String
    let colour: String
    let brand: String
    let yearOfManufacture: Int
    let milage: Int
    let numberOfWheels: Int
    let topSpeed: Int

    init() {
        self.model = " "
        self.colour = " "
        self.brand = " "
        self.yearOfManufacture = 0
        self.milage = 0
        self.numberOfWheels = 0
        self.topSpeed = 0           
    }
    

    init(model: String, colour: String, brand: String, yearOfManufacture: Int,milage: Int, numberOfWheels: Int, topSpeed: Int) {
        self.model = model
        self.colour = colour
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.milage = milage
        self.numberOfWheels = numberOfWheels
        self.topSpeed = topSpeed
    }
    
    func printDetailes() {
        print("Model is \(model)")
        print("colour is \(colour)")
        print("Brand is \(brand)")
        print("\(model) is manufactured in the year \(yearOfManufacture)")
        print("\(model) has milage \(milage) km pre liter")
        print("\(model) is a \(numberOfWheels) wheeler")
        print("\(model) has a top speed of \(topSpeed) kmph")
    }
    
}

let car1 = Car(model: "jipsy", colour: "black", brand: "Maruthi", yearOfManufacture: 1999, milage: 22, numberOfWheels: 4, topSpeed: 120)
car1.printDetailes()
