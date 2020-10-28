import Foundation

class MovieTheatre {

    var theatreDetailes: [String : Any]
    var movieLanguage: [String]
    var numberOfSeats: [String : Int]
    var listOfMovies: [String]
    var isDetailesEmpty: Bool = true

    init() {
        self.theatreDetailes = ["Theatre Name": " ", 
                                "Adress": " ",
                                "Theatre ID:": 0,
                                "Rating": 0 ]
        self.movieLanguage = ["Hindi", "English"]
        self.numberOfSeats = ["Normal": 0, 
                                "Executive": 0,
                                "Premium": 0,
                                "VIP": 0 ] 
        self.listOfMovies = ["Thmbad", "Spiderman" , "Avengers"]
        isDetailesEmpty = true
    }
    init(theatername: String, adress: String, id: Int, rating: Int, normalSeat: Int, exectiveSeat: Int, premiumSeat: Int, vipSeat: Int){
        self.theatreDetailes = ["Theatre Name": theatername, 
                                "Adress": adress,
                                "Theatre ID:": id,
                                "Rating":rating ]
        self.movieLanguage = ["Hindi", "English"]
        self.numberOfSeats = ["Normal": normalSeat, 
                                "Executive": exectiveSeat,
                                "Premium": premiumSeat,
                                "VIP": vipSeat] 
        self.listOfMovies = ["Thmbad", "Spiderman" , "Avengers"]
        isDetailesEmpty = false
    }

    
    func fillTheatreDetails(name: String, adress: String, id: Int, rating: Int ) {
        self.theatreDetailes["Theatre Name"] = name
        self.theatreDetailes["Adress"] = adress
        self.theatreDetailes["Theatre ID"] = id
        self.theatreDetailes["Rating"] = rating
        isDetailesEmpty = false
    }

    func fillNumberOfSeats(normal: Int, executive: Int, premium: Int, vip: Int) {
        self.numberOfSeats["Normal"] = normal
        self.numberOfSeats["Executive"] = executive
        self.numberOfSeats["Premium"] = premium
        self.numberOfSeats["VIP"] = vip
    }

    /*func reserveSeats(type: String, numberOfSeats: Int) {
        switch type {
            case "Normal":{
                var availabeNormalSeats: Int
                if let temp = self.numberOfSeats["Normal"]{
                    availabeNormalSeats = temp
                }
                if (availabeNormalSeats - numberOfSeats >= 0 && numberOfSeats < availabeNormalSeats) {
                    self.numberOfSeats.updateValue["Normal"] = self.numberOfSeats["Normal"] - numberOfSeats
                }else{
                    print("There is no enough Normal seats available check other type")
                }
            }
            case "Executive":{
                var availabeExecutiveSeats: Int
                if let temp = self.numberOfSeats["Executive"]{
                    availabeExecutiveSeats = temp
                }
                if (availabeExecutiveSeats - numberOfSeats >= 0 && numberOfSeats < availabeExecutiveSeats) {
                    self.numberOfSeats.updateValue["Executive"] = self.numberOfSeats["Executive"] - numberOfSeats
                }else{
                    print("There is no enough Executive seats available check other type")
                }
            }
            case "Premium":{
                var availabePremiumSeats: Int
                if let temp = self.numberOfSeats["Premium"]{
                    availabePremiumSeats = temp
                }
                if (availabePremiumSeats - numberOfSeats >= 0 && numberOfSeats < availabePremiumSeats) {
                    if let oldValue = numberOfSeats.updateValue(self.numberOfSeats["Premium"] - numberOfSeats, forKey: "Premium"){
                        //
                    }
                    //self.numberOfSeats.updateValue["Premium"] = self.numberOfSeats["Premium"] - numberOfSeats
                }else{
                    print("There is no enough Premium seats available check other type")
                }
            }
            case "VIP":{
                var availabeVIPSeats: Int
                if let temp = self.numberOfSeats["VIP"]{
                    availabeVIPSeats = temp
                }
                if (availabeVIPSeats - numberOfSeats >= 0 && numberOfSeats < availabeVIPSeats) {
                    self.numberOfSeats.updateValue["VIP"] = self.numberOfSeats["VIP"] - numberOfSeats
                }else{
                    print("There is no enough VIP seats available check other type")
                }
            }
                
            default:{
                print("Incorrect Type please enter valid type of seat")
            }
         
        }
    }*/
    func displayMovieLanguage() {
        print("Language of Movies played")
        for item in movieLanguage {
            print(item)
        }   
    }

    func displayListOfMovies() {
        print("Todays Movies are")
        for item in listOfMovies {
           print(item)
        }
    }
    func printTheaterdetail() {
    
        if !(isDetailesEmpty) {
        if let temp = theatreDetailes["Theatre Name"]{
            print("Theatre Name is \(temp)")
        }
        if let temp = theatreDetailes["Theatre ID"]{
           print("Theatre has an ID number \(temp)")
        }
        if let temp = theatreDetailes["Adress"]{
            print("Adress is \(temp)")
        }
        if let temp = theatreDetailes["Rating"]{
            print("Has rating \(temp)")
        }
        }else {
            print("Enter the Theater Details first")
        } 
    }
}

var theatre1 = MovieTheatre()
theatre1.fillTheatreDetails(name:"Kohinoor", adress:"kasargod", id: 123, rating: 5 )
theatre1.printTheaterdetail()
theatre1.displayMovieLanguage()
theatre1.displayListOfMovies()
theatre1.fillNumberOfSeats(normal: 50, executive: 25, premium: 12, vip: 10)
//theatre1.reserveSeats(type:"Normal", numberOfSeats: 2)