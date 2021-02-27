//
//  Ask.swift
//  aAnguiano_Project02
//
//  Created by Andy Anguiano on 2/25/21.
//

import Foundation

class Ask{
    static func AskQuestion(questionText output: String,
                            acceptableReplies inputArr: [String],
                            caseSensitive: Bool = false) -> String{
        print(output)
        
        guard let response = readLine() else{
            print("Invalid Input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
        
        if inputArr.contains(response) || inputArr.isEmpty{
            return response
        }else{
            print("Invalid Input")
            return AskQuestion(questionText: output, acceptableReplies: inputArr)
        }
    }
}
