//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public enum TimeFrame: String {
    case day = "DAY"
    case week = "WEEK"
    case month = "MONTH"
    case year = "YEAR"
    
    static public func with(string: String) -> TimeFrame {
        return .day
    }
}

extension TimeFrame {
    static var displayValu: String {
        return ""
    }
}

TimeFrame.with(string: "..")


TimeFrame.day
