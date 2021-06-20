import Foundation

class CoronaClass {
 
   var seats = [Int]()
    var place: Int

    init(n: Int) {
        place = n
    }
    
    func seat() -> Int  {
        var temp = 0
        var indexSeats = 0
        var placeStudent = 0
        
        if seats.isEmpty {
            seats.append(0)
        } else {
            if seats.first != 0 {
                placeStudent = 0
                seats.insert(placeStudent, at: 0)
                return placeStudent
            }
            if seats.last != place - 1 && seats.count < 2{
                seats.append(place - 1)
                placeStudent = place - 1
            } else {
                for index in 1 ..< seats.count {
                    if (seats[index] - seats[index - 1]) / 2 > temp {
                        temp = (seats[index] - seats[index - 1]) / 2
                        indexSeats = index
                        placeStudent = seats[index - 1] + temp
                    }
                }
                
                if seats.last != place - 1 {
                    if place - 1 - seats.last! > temp {
                        placeStudent = place - 1
                        seats.append(place - 1)
                        return placeStudent
                    }
                }
                seats.insert(placeStudent, at: indexSeats)
            }
        }
        return placeStudent
    }
     
    func leave(_ p: Int) {
        print(p)
        if let index = seats.firstIndex(of: p) {
            print(index)
            seats.remove(at: index)
        }
    }
}
