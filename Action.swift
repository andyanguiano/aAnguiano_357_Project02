//
//  Action.swift
//  aAnguiano_Project02
//
//  Created by Andy Anguiano on 2/25/21.
//

import Foundation

var finalDict: [String:String] = [:]

class Action{
    
    static func ViewAll(){
        print(finalDict.keys)
    }
    
    static func ViewSingle(correspondingKey theKey: String, thePassPhrase passPhrase: String)-> String{
        var password = ""
        let allKeys = finalDict.keys
        for keys in allKeys{
            if keys == theKey{
                password = String(finalDict[keys]!)
                password = Helpers.desCesear(word: password)
                let phraseCount = Int(passPhrase.count)
                let passCount = Int(password.count)
                let index = password.index(password.startIndex, offsetBy:(passCount-phraseCount))
                let newPassword = password[..<index]
                print(String(newPassword))
                return String(newPassword)
            }
        }
        return("Invalid Input")
    }
    
    static func DeletePass(correspondingKey theKey: String){
        let conclusion = finalDict.removeValue(forKey: theKey)
        if conclusion == nil{
            print("Invalid Input")
        }else{
            print("Successfully deleted")
        }
    }
    
    static func AddPass(correspondingName name: String, thePassword password: String, correspondingPassphrase passphrase: String) -> String{
        var endPassword = String(password) + String(passphrase)
        endPassword = Helpers.Cesear(word: endPassword)
        finalDict.updateValue(endPassword, forKey: name)
        return endPassword
    }
    
    
    func Initiate(){
        do{
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("TOPSECRET.json")
            
            try JSONSerialization.data(withJSONObject: finalDict).write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    
    func ReadDict()->Any{
        do{
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("TOPSECRET.json")
            
            let data = try Data(contentsOf: fileURL)
            let mainDict = try JSONSerialization.jsonObject(with: data)
            finalDict = mainDict as! [String:String]
            return mainDict
        } catch {
            print(error)
            return "Error"
        }
    }
}

