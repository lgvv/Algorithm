//
//  12985.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//

//https://programmers.co.kr/learn/courses/30/lessons/12985
import Foundation

struct p12985 {
    static func run() {
        print(p12985.solution(8, 4, 7)) // 3
    }
    
    static func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
        var answer = 0
        
        var a = Double(a)
        var b = Double(b)
        
        if a > b {
            let temp = a
            a = b
            b = temp
        }
        
        while true {
            answer += 1
            if (Int(b) % 2 == 0) && (b - a == 1) { break }
            a = ceil(a / 2)
            b = ceil(b / 2)
        }
        
        return Int(answer)
    }
}

