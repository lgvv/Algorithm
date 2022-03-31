//
//  12911.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
//https://programmers.co.kr/learn/courses/30/lessons/12911
import Foundation

struct p12911 {
    static func run() {
        print(p12911.solution(78)) // 83
    }

    static func solution(_ n:Int) -> Int {
        
        let answer: Int = String(n, radix: 2).filter { $0 != "0" }.count
        var length: Int = 0
        
        var n = n + 1
        while true {
            length = String(n, radix: 2).filter { $0 != "0" }.count
            if length == answer { break }
            
            n += 1
        }
        
        return n
    }
}
