//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)

/*
From blog post:
http://www.binpress.com/tutorial/swiftyjson-how-to-handle-json-in-swift/111
*/


//  JSON.swift
//
//  Copyright (c) 2014 Ruoyu Fu, Pinglin Tang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

@available(*, unavailable, renamed: "JSON")
public typealias JSONValue = JSON

//MARK:- Base
//http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf
public enum JSON {
    
    //private type number
    case scalarNumber(NSNumber)
    //private type string
    case scalarString(NSString)
    //private type sequence
    case sequence(Array<JSON>)
    //private type mapping
    case mapping([String: JSON])
    //private type null
    case null(NSError?)
    
    /**
    :param: data The NSData used to convert to json.
    :param: options The JSON serialization reading options. `.AllowFragments` by default.
    :param: error The NSErrorPointer used to return the error.
    */
    public init(data:Data, options opt: JSONSerialization.ReadingOptions = .allowFragments, error: NSErrorPointer? = nil) {
        if let object: AnyObject = try! JSONSerialization.jsonObject(with: data, options: opt) as AnyObject?{
            self = JSON(object: object)
        } else {
            self = .null(nil)
        }
    }
    
    /**
    :param: object The JSON object following the JSON's definition
    */
    public init(object: AnyObject) {
        switch object {
        case let number as NSNumber:
            self = .scalarNumber(number)
        case let string as NSString:
            self = .scalarString(string)
        case  _ as NSNull:
            self = .null(nil)
        case let array as Array<AnyObject>:
            var jsonArray = Array<JSON>()
            for object : AnyObject in array {
                jsonArray.append(JSON(object: object))
            }
            self = .sequence(jsonArray)
        case let dictionary as NSDictionary:
            var jsonDictionary = Dictionary<String, JSON>()
            for (key, value) in dictionary {
                if let key = key as? NSString {
                    jsonDictionary[key as String] = JSON(object: value as AnyObject)
                }
            }
            self = .mapping(jsonDictionary)
        case  _ as NSNull:
            self = .null(nil)
        default:
            self = .null(NSError(domain: ErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "It is a unsupported type"]))
        }
    }
}

//MARK: - Return Error
//The SwiftyJSON's error domain
public let ErrorDomain: String! = "SwiftyJSONErrorDomain"
//The error code
public var ErrorUnsupportedType: Int { get { return 999 }}
public var ErrorIndexOutOfBounds: Int { get { return 900 }}
public var ErrorWrongType: Int { get { return 901 }}
public var ErrorNotExist: Int { get { return 500 }}

extension JSON {
    
    // The error in the .Null enmu
    public var error: NSError? {
        get {
            switch self {
            case .null(let error) where error != nil:
                return error
            default:
                return nil;
            }
        }
    }
    
}

//MARK:- Object
extension JSON {
    
    // The json object which is init(object:)'s parameter
    public var object: AnyObject? {
        switch self {
        case .scalarNumber(let number):
            return number
        case .scalarString(let string):
            return string
        case .null(let error) where error == nil:
            return NSNull()
        case .sequence(let array):
            var retArray = Array<AnyObject>()
            for json in array {
                if let object: AnyObject = json.object {
                    retArray.append(object)
                }
            }
            return retArray as AnyObject?
        case .mapping(let dictionary):
            var retDicitonary = Dictionary<String, AnyObject>()
            for (key, value) in dictionary {
                if let object: AnyObject = value.object{
                    retDicitonary[key] = object
                }
            }
            return retDicitonary as AnyObject?
        default:
            return nil
        }
    }
}

// MARK: - Subscript
extension JSON {
    
    //if an array return the array[index]'s JSON else return .Null with error
    public subscript(index: Int) -> JSON {
        get {
            switch self {
            case .sequence(let array):
                if array.count > index {
                    return array[index]
                } else {
                    return .null(NSError(domain: ErrorDomain, code:ErrorIndexOutOfBounds , userInfo: [NSLocalizedDescriptionKey: "Array[\(index)] is out of bounds"]))
                }
            default:
                return .null(NSError(domain: ErrorDomain, code: ErrorWrongType, userInfo: [NSLocalizedDescriptionKey: "Wrong type, It is not an array"]))
            }
        }
    }
    
    //if an array return the dictionary[key]'s JSON else return .Null with error
    public subscript(key: String) -> JSON {
        get {
            switch self {
            case .mapping(let dictionary):
                if let value = dictionary[key] {
                    return value
                } else {
                    return .null(NSError(domain: ErrorDomain, code: ErrorNotExist, userInfo: [NSLocalizedDescriptionKey: "Dictionary[\"\(key)\"] does not exist"]))
                }
            default:
                return .null(NSError(domain: ErrorDomain, code: ErrorWrongType, userInfo: [NSLocalizedDescriptionKey: "Wrong type, It is not an dictionary"]))
            }
        }
    }
}

//MARK: - Printable, DebugPrintable
extension JSON: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        switch self {
        case .scalarNumber(let number):
            switch String(cString: number.objCType) {
            case "c", "C":
                return number.boolValue.description
            default:
                return number.description
            }
        case .scalarString(let string):
            return string as String
        case .sequence(let array):
            return array.description
        case .mapping(let dictionary):
            return dictionary.description
        case .null(let error) where error != nil :
            return error!.description
        default:
            return "null"
        }
    }
    
    public var debugDescription: String {
        get {
            switch self {
            case .scalarNumber(let number):
                switch String(cString: number.objCType) {
                case "c", "C":
                    return number.boolValue.description
                default:
                    return number.debugDescription
                }
            case .scalarString(let string):
                return string.debugDescription
            case .sequence(let array):
                return array.debugDescription
            case .mapping(let dictionary):
                return dictionary.debugDescription
            case .null(let error) where error != nil :
                return error!.debugDescription
            default:
                return "null"
            }
        }
    }
}

// MARK: - Sequence: Array<JSON>
extension JSON {
    
    //Optional array
    public var array: Array<JSON>? {
        get {
            switch self {
            case .sequence(let array):
                return array
            default:
                return nil
            }
        }
    }
    
    //Non-optional array
    public var arrayValue: Array<JSON> {
        get {
            return self.array ?? []
        }
    }
}

// MARK: - Mapping: Dictionary<String, JSON>
extension JSON {
    
    //Optional dictionary
    public var dictionary: Dictionary<String, JSON>? {
        get {
            switch self {
            case .mapping(let dictionary):
                return dictionary
            default:
                return nil
            }
        }
    }
    
    //Non-optional dictionary
    public var dictionaryValue: Dictionary<String, JSON> {
        get {
            return self.dictionary ?? [:]
        }
    }
}

//MARK: - Scalar: Bool
extension JSON {
    
    //Optional bool
    public var bool: Bool? {
        get {
            return self.number?.boolValue
        }
    }
    
    //Non-optional bool
    public var boolValue: Bool {
        switch self {
        case .scalarNumber(let number):
            return number.boolValue
        case .scalarString(let string):
            return (string as NSString).boolValue
        case .sequence(let array):
            return array.count > 0
        case .mapping(let dictionary):
            return dictionary.count > 0
        case .null:
            return false
        default:
            return true
        }
    }
}

//MARK: - Scalar: String, NSNumber, NSURL, Int, ...
extension JSON {
    
    //Optional string
    public var string: String? {
        get {
            switch self {
            case .scalarString(let string):
                return string as String
            default:
                return nil
            }
        }
    }
    
    //Non-optional string
    public var stringValue: String {
        get {
            switch self {
            case .scalarString(let string):
                return string as String
            case .scalarNumber(let number):
                switch String(cString: number.objCType) {
                case "c", "C":
                    return number.boolValue.description
                default:
                    return number.stringValue
                }
            default:
                return ""
            }
        }
    }
    
    //Optional number
    public var number: NSNumber? {
        get {
            switch self {
            case .scalarString(let string):
                var ret: NSNumber? = nil
                let scanner = Scanner(string: string as String)
                if scanner.scanDouble(nil){
                    if (scanner.isAtEnd) {
                        ret = NSNumber(value: (string as NSString).doubleValue as Double)
                    }
                }
                return ret
            case .scalarNumber(let number):
                return number
            default:
                return nil
            }
        }
    }
    
    //Non-optional number
    public var numberValue: NSNumber {
        get {
            switch self {
            case .scalarString(let string):
                let scanner = Scanner(string: string as String)
                if scanner.scanDouble(nil){
                    if (scanner.isAtEnd) {
                        return NSNumber(value: (string as NSString).doubleValue as Double)
                    }
                }
                return NSNumber(value: 0.0 as Double)
            case .scalarNumber(let number):
                return number
            default:
                return NSNumber(value: 0.0 as Double)
            }
        }
    }
    
    //Optional URL
    public var URL: Foundation.URL? {
        get {
            switch self {
            case .scalarString(let string):
                if let encodedString = string.addingPercentEscapes(using: String.Encoding.utf8.rawValue) {
                    return Foundation.URL(string: encodedString)
                } else {
                    return nil
                }
            default:
                return nil
            }
        }
    }
    
    //Optional Int8
    public var char: Int8? {
        get {
            return self.number?.int8Value
        }
    }
    
    //Optional Int8
    public var charValue: Int8 {
        get {
            return self.numberValue.int8Value
        }
    }
    
    //Optional UInt8
    public var unsignedChar: UInt8? {
        get{
            return self.number?.uint8Value
        }
    }
    
    //Non-optional UInt8
    public var unsignedCharValue: UInt8 {
        get{
            return self.numberValue.uint8Value
        }
    }
    
    //Optional Int16
    public var short: Int16? {
        get{
            return self.number?.int16Value
        }
    }
    
    //Non-optional UInt8
    public var shortValue: Int16 {
        get{
            return self.numberValue.int16Value
        }
    }
    
    //Optional UInt16
    public var unsignedShort: UInt16? {
        get{
            return self.number?.uint16Value
        }
    }
    
    //Non-optional UInt16
    public var unsignedShortValue: UInt16 {
        get{
            return self.numberValue.uint16Value
        }
    }
    
    //Optional Int
    public var long: Int? {
        get{
            return self.number?.intValue
        }
    }
    
    //Non-optional Int
    public var longValue: Int {
        get{
            return self.numberValue.intValue
        }
    }
    
    //Optional UInt
    public var unsignedLong: UInt? {
        get{
            return self.number?.uintValue
        }
    }
    
    //Non-optional UInt
    public var unsignedLongValue: UInt {
        get{
            return self.numberValue.uintValue
        }
    }
    
    //Optional Int64
    public var longLong: Int64? {
        get{
            return self.number?.int64Value
        }
    }
    
    //Non-optional Int64
    public var longLongValue: Int64 {
        get{
            return self.numberValue.int64Value
        }
    }
    
    //Optional UInt64
    public var unsignedLongLong: UInt64? {
        get{
            return self.number?.uint64Value
        }
    }
    
    //Non-optional UInt64
    public var unsignedLongLongValue: UInt64 {
        get{
            return self.numberValue.uint64Value
        }
    }
    
    //Optional Float
    public var float: Float? {
        get {
            return self.number?.floatValue
        }
    }
    
    //Non-optional Float
    public var floatValue: Float {
        get {
            return self.numberValue.floatValue
        }
    }
    
    //Optional Double
    public var double: Double? {
        get {
            return self.number?.doubleValue
        }
    }
    
    //Non-optional Double
    public var doubleValue: Double {
        get {
            return self.numberValue.doubleValue
        }
    }
    
    //Optional Int
    public var integer: Int? {
        get {
            return self.number?.intValue
        }
    }
    
    //Non-optional Int
    public var integerValue: Int {
        get {
            return self.numberValue.intValue
        }
    }
    
    //Optional Int
    public var unsignedInteger: Int? {
        get {
            return self.number?.intValue
        }
    }
    
    //Non-optional Int
    public var unsignedIntegerValue: Int {
        get {
            return Int(self.numberValue.uintValue)
        }
    }
    
    //Optional Int32
    public var int: Int32? {
        get {
            return self.number?.int32Value
        }
    }
    
    //non-optional Int32
    public var intValue: Int32 {
        get {
            return self.numberValue.int32Value
        }
    }
}

//MARK: - Comparable
extension JSON: Comparable {
    
    fileprivate var type: Int {
        get {
            switch self {
            case .scalarNumber(_):
                return 1
            case .scalarString(_):
                return 2
            case .sequence(_):
                return 3
            case .mapping(_):
                return 4
            case .null(let error):
                if error == nil {
                    return 0
                } else {
                    return error!.code
                }
            default:
                return -1
            }
        }
    }
}

public func ==(lhs: JSON, rhs: JSON) -> Bool {
    
    if lhs.number != nil && rhs.number != nil {
        return lhs.number == rhs.number
    }
    
    if lhs.type != rhs.type {
        return false
    }
    
    switch lhs {
    case JSON.scalarNumber:
        return lhs.numberValue == rhs.numberValue
    case JSON.scalarString:
        return lhs.stringValue == rhs.stringValue
    case .sequence:
        return lhs.arrayValue == rhs.arrayValue
    case .mapping:
        return lhs.dictionaryValue == rhs.dictionaryValue
    case .null:
        return true
    default:
        return false
    }
}

public func <=(lhs: JSON, rhs: JSON) -> Bool {
    
    if lhs.number != nil && rhs.number != nil {
        return lhs.number <= rhs.number
    }
    
    if lhs.type != rhs.type {
        return false
    }
    
    switch lhs {
    case JSON.scalarNumber:
        return lhs.numberValue <= rhs.numberValue
    case JSON.scalarString:
        return lhs.stringValue <= rhs.stringValue
    case .sequence:
        return lhs.arrayValue == rhs.arrayValue
    case .mapping:
        return lhs.dictionaryValue == rhs.dictionaryValue
    case .null:
        return true
    default:
        return false
    }
}

public func >=(lhs: JSON, rhs: JSON) -> Bool {
    
    if lhs.number != nil && rhs.number != nil {
        return lhs.number >= rhs.number
    }
    
    if lhs.type != rhs.type {
        return false
    }
    
    switch lhs {
    case JSON.scalarNumber:
        return lhs.numberValue >= rhs.numberValue
    case JSON.scalarString:
        return lhs.stringValue >= rhs.stringValue
    case .sequence:
        return lhs.arrayValue == rhs.arrayValue
    case .mapping:
        return lhs.dictionaryValue == rhs.dictionaryValue
    case .null:
        return true
    default:
        return false
    }
}

public func >(lhs: JSON, rhs: JSON) -> Bool {
    
    if lhs.number != nil && rhs.number != nil {
        return lhs.number > rhs.number
    }
    
    if lhs.type != rhs.type {
        return false
    }
    
    switch lhs {
    case JSON.scalarNumber:
        return lhs.numberValue > rhs.numberValue
    case JSON.scalarString:
        return lhs.stringValue > rhs.stringValue
    case .sequence:
        return false
    case .mapping:
        return false
    case .null:
        return false
    default:
        return false
    }
}

public func <(lhs: JSON, rhs: JSON) -> Bool {
    
    if lhs.number != nil && rhs.number != nil {
        return lhs.number < rhs.number
    }
    
    if lhs.type != rhs.type {
        return false
    }
    
    switch lhs {
    case JSON.scalarNumber:
        return lhs.numberValue < rhs.numberValue
    case JSON.scalarString:
        return lhs.stringValue < rhs.stringValue
    case .sequence:
        return false
    case .mapping:
        return false
    case .null:
        return false
    default:
        return false
    }
}

// MARK: - NSNumber: Comparable
extension NSNumber: Comparable {
}

public func ==(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return lhs.compare(rhs) == ComparisonResult.orderedSame
}

public func <(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return lhs.compare(rhs) == ComparisonResult.orderedAscending
}

public func >(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return lhs.compare(rhs) == ComparisonResult.orderedDescending
}

public func <=(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return !(lhs > rhs)
}

public func >=(lhs: NSNumber, rhs: NSNumber) -> Bool {
    return !(lhs < rhs)
}




import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


var jsonString = "[{\"id\":1, \"name\": \"Eliott\", \"email\": \"eliott@gmail.com\"}," +
"{\"id\":2, \"name\": \"Emilie\", \"email\": \"emilie@gmail.com\"}]"
var data = jsonString.data(using: String.Encoding.utf8)

let jsonObject: AnyObject! = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject!
// Handling JSON in Swift with optional and type casting
if let personsArray = jsonObject as? NSArray {
    if let firstPerson = personsArray[0] as? NSDictionary {
        if let name = firstPerson["name"] as? NSString {
            print("First person name is \(name)")
        }
    }
}

// Using SwiftyJSON
let json = JSON(data: data!)
if let userName = json[0]["name"].string {
    print("First person name is \(userName)")
}


//: [Table of Contents](Agenda) | [Previous](@previous) | [Next](@next)
