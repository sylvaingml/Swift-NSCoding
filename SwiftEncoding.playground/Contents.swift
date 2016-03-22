//: Playground - noun: a place where people can play

import Cocoa

/** Custom object
 
 We must implement NSCoding protocol and also rely on ObjC runtime.
 
 So we can either use @objc annotation or extends NSObject.
 
 */
class CustomPoint: NSObject, NSCoding {
    var x: Double = 0.0
    var y: Double = 0.0
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    required init?(coder aDecoder: NSCoder) {
        x = aDecoder.decodeDoubleForKey("x")
        y = aDecoder.decodeDoubleForKey("y")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(x, forKey: "x")
        aCoder.encodeDouble(y, forKey: "y")
    }
    
    override var description: String {
        get {
            return "[ x=\(x) ; y=\(y) ]"
        }
    }
}

var shape: [CustomPoint] = [];

for var index in 1...12 {
    let theX = Double.init(index)
    let thePoint = CustomPoint(x: theX, y: theX*theX)
    shape.append(thePoint)
}

print(shape)

let carbonite = NSKeyedArchiver.archivedDataWithRootObject(shape)

let lazarus = NSKeyedUnarchiver.unarchiveObjectWithData(carbonite) as! [CustomPoint]

print(lazarus)
