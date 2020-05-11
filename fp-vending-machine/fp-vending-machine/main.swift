//
//  main.swift
//  fp-vending-machine
//
//  Created by Jaedoo Ko on 2020/05/11.
//  Copyright © 2020 jko. All rights reserved.
//

import Foundation

enum Product {
    case cola
    case cider
    case fanta
    
    var name: String {
        switch self {
        case .cola: return "콜라"
        case .cider: return "사이다"
        case .fanta: return "환타"
        }
    }
    
    var price: Int {
        switch self {
        case .cola: return 1000
        case .cider: return 1100
        case .fanta: return 1000
        }
    }
}

enum Input {
    case moneyInput(Int)
    case productSelect(Product)
    case stockRefill(Product, Int)
    case reset
    case none
}

enum Output {
    case displayMoney(Int)
    case displayStock(Stock)
    case productOut(Product)
    case outOfStock(Product)
    case shortMoneyError
    case change(Int)
}

typealias Stock = Dictionary<Product, Int>


struct State {
    let money: Int
    let count: Int
    let stock: Stock
    
    static func initial() -> State {
        let stock = [ Product.cola: 3, Product.cider: 3, Product.fanta: 3 ]
        return State(money: 0, count: 0, stock: stock)
    }
}

func stockToString(stock: Stock) -> String {
    return stock.reduce("") { str, keyValue in
        return str + "\(keyValue.key.name) - \(keyValue.value)개\n"
    }
}

func changeStock(_ before: Stock, _ product: Product, _ numOfStock: Int) -> Stock {
    var stock: Stock = before
    stock[product] = numOfStock
    return stock
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
    case "refill cola": return .stockRefill(.cola, 1)
    case "refill cider": return .stockRefill(.cider, 1)
    case "refill fanta": return .stockRefill(.fanta, 1)
    case "reset": return .reset
    default: return .none
    }
}

func consoleOutput(_ output: Output) {
    switch output {
    case .displayMoney(let m):
        print("현재 금액은 \(m)원 입니다.")
    case .displayStock(let s):
        print("현재 재고 상태\n\(stockToString(stock: s))")
    case .productOut(let p):
        print("\(p.name)가 나왔습니다.")
    case .outOfStock(let p):
        print("\(p.name)의 재고가 없습니다.")
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
            return State(money: money, count: state.count + 1, stock: state.stock)
            
        case .stockRefill(let p, let n):
            let stock = changeStock(state.stock, p, (state.stock[p] ?? 0) + n)
            outputF(.displayStock(stock))
            return State(money: state.money, count: state.count + 1, stock: stock)
            
        case .productSelect(let p):
            if (state.stock[p] ?? 0) < 1 {
                outputF(.outOfStock(p))
                outputF(.displayStock(state.stock))
                return State(money: state.money, count: state.count + 1, stock: state.stock)
            }
            if state.money < p.price {
                outputF(.shortMoneyError)
                return State(money: state.money, count: state.count + 1, stock: state.stock)
            }
            outputF(.productOut(p))
            let money = state.money - p.price
            let stock = changeStock(state.stock, p, (state.stock[p] ?? 0) - 1)
            outputF(.displayMoney(money))
            return State(money: money, count: state.count + 1, stock: stock)
            
        case .reset:
            outputF(.change(state.money))
            outputF(.displayMoney(0))
            return State(money: 0, count: state.count + 1, stock: state.stock)
            
        case .none:
            return State(money: state.money, count: state.count + 1, stock: state.stock)
        }
    }
}

func loop(_ f: (State) -> State) {
    func recur(_ s: State) {
        if s.count > 50 { return }
        recur(f(s))
    }
    
    recur(State.initial())
}

loop(operate(consoleInput, consoleOutput))
