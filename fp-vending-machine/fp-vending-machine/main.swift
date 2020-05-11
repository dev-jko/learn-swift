//
//  main.swift
//  fp-vending-machine
//
//  Created by Jaedoo Ko on 2020/05/11.
//  Copyright © 2020 jko. All rights reserved.
//

import Foundation

enum Product: Int {
    case cola = 1000
    case cider = 1100
    case fanta = 1300
    
    func name() -> String {
        switch self {
        case .cola: return "콜라"
        case .cider: return "사이다"
        case .fanta: return "환타"
        }
    }
}

enum Input {
    case moneyInput(Int)
    case productSelect(Product)
    case reset
    case none
}

enum Output {
    case displayMoney(Int)
    case productOut(Product)
    case shortMoneyError
    case change(Int)
}

struct State {
    let money: Int
    let count: Int
    
    static func initial() -> State {
        return State(money: 0, count: 0)
    }
}

func consoleInput() -> Input {
    let input = readLine()
    switch input {
    case "100": return .moneyInput(100)
    case "500": return .moneyInput(500)
    case "1000": return .moneyInput(1000)
    case "cola": return .productSelect(.cola)
    case "cider": return .productSelect(.cider)
    case "fanta": return .productSelect(.fanta)
    case "reset": return .reset
    default: return .none
    }
}

func consoleOutput(_ output: Output) {
    switch output {
    case .displayMoney(let m):
        print("현재 금액은 \(m)원 입니다.")
    case .productOut(let p):
        print("\(p.name())가 나왔습니다.")
    case .shortMoneyError:
        print("잔액이 부족합니다.")
    case .change(let c):
        print("잔액 \(c)원이 나왔습니다.")
    }
}

func operate(_ inputF: @escaping () -> (Input), _ outputF: @escaping (Output) -> ()) -> (_ state: State) -> State {
    return { state in
        let input = inputF()
        switch input {
        case .moneyInput(let m):
            let money = state.money + m
            outputF(.displayMoney(money))
            return State(money: money, count: state.count + 1)
            
        case .productSelect(let p):
            if state.money < p.rawValue {
                outputF(.shortMoneyError)
                return State(money: state.money, count: state.count + 1)
            }
            outputF(.productOut(p))
            let money = state.money - p.rawValue
            outputF(.displayMoney(money))
            return State(money: money, count: state.count + 1)
            
        case .reset:
            outputF(.change(state.money))
            outputF(.displayMoney(0))
            return State(money: 0, count: state.count + 1)
            
        case .none:
            return State(money: state.money, count: state.count + 1)
        }
    }
}

func loop(_ f: (State) -> State) {
    func recur(_ s: State) {
        if s.count > 10 { return }
        recur(f(s))
    }
    
    recur(State.initial())
}

loop(operate(consoleInput, consoleOutput))
