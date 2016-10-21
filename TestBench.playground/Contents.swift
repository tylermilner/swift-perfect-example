//: Playground - noun: a place where people can play

///
/// README
/// 
/// This playground runs on-the-fly to generate near instantaneous results.
/// Feel free to add things here to make small examples or test things out.
/// Playgrounds are a great way to learn about Swift or explore APIs.
///

import UIKit

var str = "Hello, playground"

func jediTrainer () -> ((String, Int) -> String) {
    // Using a named function
//    func train(name: String, times: Int) -> (String) {
//        return "\(name) has been trained in the Force \(times) times"
//    }
//    return train
    
    // Using an anonymous function
    return { (name, times) in
        return "\(name) has been trained in the Force \(times) times"
    }
}

let train = jediTrainer()
train("Obi Wan", 3)
