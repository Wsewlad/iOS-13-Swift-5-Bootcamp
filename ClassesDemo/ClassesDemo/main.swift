protocol CanFly {
    func fly()
}

class Bird  {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("New bird born")
        }
    }
}

class Eagle: Bird, CanFly {
    
    func fly() {
        print("Eagle fly")
    }
    
    func soar() {
        print("Eagle glides")
    }
}

class Penguin: Bird {
    func swim() {
        print("Penguin swims")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}


struct Airplane: CanFly {
    func fly() {
        print("Airplane fly")
    }
}

let myEagle = Eagle()
let myPenguin = Penguin()
let myAirplane = Airplane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
