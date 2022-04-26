//
//  67257.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/16.
//
// https://programmers.co.kr/learn/courses/30/lessons/67257
import Foundation

struct p67257 {
    static func run() {
        print(p67257.solution("100-200*300-500+20")) // 60420
        // * > + > - 순서 : 100 - 60000 - 520  = 60420
        // array : 100, -, 60000, -, 520
//                print(p67257.solution("50*6-3*2")) // 300
        // - > * 순서: 50, *, 3, * 2
        
        
    }
    
    static func solution(_ expression:String) -> Int64 {
        
        let numbers = expression.split { $0 == "*" || $0 == "+" || $0 == "-" }.map { String($0) }
        let operators = expression.split { $0.isNumber }.map { String($0) }
        
        
        var list = [String]()
        for i in 0..<operators.count {
            list.append(numbers[i])
            list.append(operators[i])
        }
        list.append(numbers.last!)
//        print("list \(list)")
        
        // 오퍼레이터의 우선순위를 설정합니다.
        let priority = [
            ("*","-","+"),
            ("*","+","-"),
            ("+","*","-"),
            ("+","-","*"),
            ("-","+","*"),
            ("-","*","+")
        ]
        
        var sumArray = [Int](repeating: 0, count: 6)
        var copyList = list
        
        for i in 0..<priority.count {
            copyList = list
            let first = priority[i].0
            let second = priority[i].1
            let third = priority[i].2
            
            while copyList.contains(first) {
                let index = copyList.firstIndex(of: first)!
                
                sumArray[i] = caculate(a: Int(copyList[index-1])!, b: Int(copyList[index+1])!, oper: first)
                
                copyList.insert(String(sumArray[i]), at: index+2)
                
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
            }
            
            while copyList.contains(second) {
                let index = copyList.firstIndex(of: second)!
                sumArray[i] = caculate(a: Int(copyList[index-1])!, b: Int(copyList[index+1])!, oper: second)
                copyList.insert(String(sumArray[i]), at: index+2)
                
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
                
            }
            
            while copyList.contains(third) {
                let index = copyList.firstIndex(of: third)!
                sumArray[i] = caculate(a: Int(copyList[index-1])!, b: Int(copyList[index+1])!, oper: third)
                copyList.insert(String(sumArray[i]), at: index+2)
               
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
                copyList.remove(at: index-1)
            }
            
        }
//        print(sumArray)
        var maxValue = 0
        sumArray.forEach { value in
            let value = abs(value)
            maxValue = max(value, maxValue)
        }
        
        return Int64(maxValue)
    }
    
    static func caculate(a: Int, b: Int, oper: String) -> Int {
        switch oper {
        case "*": return a * b
        case "-": return a - b
        case "+": return a + b
        default: return -1
        }
    }
}

