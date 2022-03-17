//
//  87389.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/16.
//

// https://programmers.co.kr/learn/courses/30/lessons/87389
import Foundation

struct p87389 {
    static func run() {
        print(p87389.solution(11)) // 2
    }
    
    static func solution(_ n:Int) -> Int {
        for divisor in 2..<n {
            if n % divisor == 1 {
                return divisor
            }
        }
        return 0
    }
}
