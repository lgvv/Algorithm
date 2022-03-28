//
//  42839.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/28.
//

//https://programmers.co.kr/learn/courses/30/lessons/42839
import Foundation

struct p42839 {
    
    static func run() {
        print(p42839.solution("4")) // 0
    }
    
    static var results: Set<Int> = []
    
    static func solution(_ numbers:String) -> Int {
        var count = 0
        
        for len in 1...numbers.count {
            reculsive(list: "", remain: numbers, len: len)
        }
        
        results.remove(0)
        results.remove(1)
        
        results.forEach { result in
            var flag = true
            
            // 소수 판별
            for number in stride(from: 2, to: result, by: 1) {
                if result % Int(number) == 0 {
                    flag = false
                    break
                }
            }
            
            if flag { count += 1 }
        }
        
        return count
    }
    
    static func reculsive(list: String , remain: String, len: Int) {
        
        if list.count == len {
            results.insert(Int(list)!)
            return
        }
        
        for i in 0..<remain.count {
            var list = list
            let index = remain.index(remain.startIndex, offsetBy: i)
            let str = remain[index]
            list = "\(list)\(str)"
            
            var arr = remain
            
            arr.remove(at: index)
            
            reculsive(list: list, remain: arr, len: len)
        }
    }
}
