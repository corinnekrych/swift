//: # Mix and Match Overview
//:
//: Objective-C and Swift files can coexist in a single project, whether the project was originally an Objective-C or Swift project.
//:
//: ![interoperability](DAG_2x.png)
//: 
//: #### Using Obj-C in your Swift project
//:
//: Most common case, each time you want to write an iOS app in Swift you face this situation using cocoa touch!

import Foundation

var objcString: NSString = "My ObjC String"

import UIKit
 
let testLabel = UILabel(frame: CGRectMake(0, 0, 120, 40))
testLabel.text = "Hello, Swift!"
testLabel.backgroundColor = UIColor(red: 0.9, green: 0.2, blue: 0.2, alpha: 1.0)
testLabel.textAlignment = NSTextAlignment.Center

//: #### Using Swift in old app
//:
//: Two cases
//: - class is visible to the Objective-C class because it subclasses NSObject.
//: - if not, then use ```@objc``` modifier to be attached.
