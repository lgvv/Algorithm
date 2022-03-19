//
//  12921.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/12921
import Foundation

struct p12921 {
    static func run() {
        print(p12921.solution(5)) // 4
    }

    static func solution(_ n:Int) -> Int {
        // 소수찾는 알고리즘
        var count = 0
        var isPrime = true
        
        for target in stride(from: 3, through: n, by: 2) { // 어차피 짝수는 2말고는 다 소수 아님
            isPrime = true
            
            for i in stride(from: 2, through: sqrt(Double(target)), by: 1) {
                if target % Int(i) == 0 {
                    isPrime = false
                    break
                }
            }
            
            if isPrime { count += 1 }
        }
        
        return count + 1
    }
}

