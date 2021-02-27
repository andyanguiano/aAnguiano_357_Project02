//
//  main.swift
//  aAnguiano_Project02
//
//  Created by Andy Anguiano on 2/25/21.
//

import Foundation

class Program{
    init(){
        
        Action().ReadDict()
        var reply = ""
        var keepRunning = true
        
        while keepRunning{
            
            reply = Ask.AskQuestion(questionText: "Would you like to view all usernames(viewall), view a single password(viewsingle), delete password (deletepass), or add password(addpass)?", acceptableReplies: ["viewall", "viewsingle", "deletepass", "addpass"])
            
            if reply.lowercased() == "viewall"{
                Action.ViewAll()
            }else if reply.lowercased() == "viewsingle"{
                let key =  Ask.AskQuestion(questionText: "What is the corresponding key?: ", acceptableReplies: [])
                let passphrase =  Ask.AskQuestion(questionText: "What is the passphrase?: ", acceptableReplies: [])
                Action.ViewSingle(correspondingKey: key, thePassPhrase: passphrase)
            }else if reply.lowercased() == "deletepass"{
                let key =  Ask.AskQuestion(questionText: "What is the corresponding key?: ", acceptableReplies: [])
                Action.DeletePass(correspondingKey: key)
            }else if reply.lowercased() == "addpass"{
                let key =  Ask.AskQuestion(questionText: "What is the name to store the password under?: ", acceptableReplies: [])
                let pass =  Ask.AskQuestion(questionText: "What is the password?: ", acceptableReplies: [])
                let passphrase =  Ask.AskQuestion(questionText: "What is the passphrase?: ", acceptableReplies: [])
                Action.AddPass(correspondingName: key, thePassword: pass, correspondingPassphrase: passphrase)
            }else{
                print("Invalid Input")
            }
            reply = Ask.AskQuestion(questionText: "Do you want to keep running the app?",
                                    acceptableReplies: ["yes", "no"])
            if reply.lowercased() == "no"{
                print("Goodbye")
                keepRunning = false
            }
        }
        Action().Initiate()
    }
}

let p = Program()



