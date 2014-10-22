
import Foundation

var jsonString:NSString = "{\"id\":1, \"name\": \"Eliott\", \"email\": \"eliott@gmail.com\"}"
var data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

// Get Data to serialized into Json object
var jsonObject: AnyObject?
if let unwrappedData = data {
    jsonObject = NSJSONSerialization.JSONObjectWithData(unwrappedData, options: nil, error: nil)
}

jsonObject
