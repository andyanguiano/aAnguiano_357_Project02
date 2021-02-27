//
//  Helpers.swift
//  aAnguiano_Project02
//
//  Created by Andy Anguiano on 2/25/21.
//

import Foundation

class Helpers{
     static func Cesear(word: String)-> String{
        var endStr = ""
        let shift = word.count
        
        
        for char in word{
            endStr += String(Translate(l: char, trans: shift))
        }
        endStr = reverse(word: endStr)
        return endStr
    }
    
    static func Translate(l: Character, trans: Int) -> Character{
        if let ascii = l.asciiValue{
            var outputInt = ascii
            if ascii >= 97 && ascii <= 122{
                //outputInt = ((ascii-97+UInt8(trans))%26)+97
                outputInt = ascii - UInt8(trans)
            }else if ascii >= 65 && ascii <= 90{
                //outputInt = ((ascii-65+UInt8(trans))%26)+65
                outputInt = ascii - UInt8(trans)
            }
            return Character(UnicodeScalar(outputInt))
        }
        return Character("")
    }

    static func desCesear(word:String) -> String{
        var newWord = word
        var endStr = ""
        let shift = word.count
        newWord = reverse(word: newWord)
        
        for char in newWord{
            endStr += String(Untranslate(l: char, trans: shift))
        }
        
        return endStr
    }
    
    static func Untranslate(l: Character, trans: Int) -> Character{
        
        if let ascii = l.asciiValue{
            var outputInt = ascii
            outputInt = ascii + UInt8(trans)
            return Character(UnicodeScalar(outputInt))
        }
        return Character("")
        
    }
    
    static func reverse(word:String)->String{
        return String(word.reversed())
    }
    
}

