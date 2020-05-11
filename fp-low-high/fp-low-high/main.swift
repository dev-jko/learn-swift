//
//  main.swift
//  fp-low-high
//
//  Created by Jaedoo Ko on 2020/05/11.
//  Copyright © 2020 jko. All rights reserved.
//

import Foundation


enum Result: String {
    case wrong = "Wrong"
    case correct = "Correct!"
    case high = "High"
    case low = "Low"
}

func printResult(_ result: Result) -> Bool {
    if result == .correct { return false }
    print(result.rawValue)
    return true
}

func evaluateInput(_ answer: Int) -> Result {
    guard let input = Int(readLine() ?? "") else { return .wrong }
    if input > answer { return .high }
    if input < answer { return .low }
    return .correct
}

func inputAndCheck(_ answer: Int) -> () -> Bool {
    return { printResult(evaluateInput(answer)) }
}

func corrected(_ count: Int) {
    print("Correct! : \(count)")
}

func loop(_ needContinue: () -> (Bool), _ finished: (Int) -> Void) {
    
    func recur(_ count: Int) -> Int {
        if !needContinue() { return count }
        return recur(count + 1)
    }
    
    finished(recur(0))
}

func generateAnswer() -> Int {
    return Int(arc4random() % 100) + 1
//    return 50
}

loop(inputAndCheck(generateAnswer()), corrected)
