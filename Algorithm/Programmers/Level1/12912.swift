//
//  12912.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/12912
import Foundation

struct p12912 {
    static func run() {
//        print(p12912.solution(3,5)) // 12
//        print(p12912.solution(3,3)) // 3
        print(p12912.solution(5,3)) // 3
    }

    static func solution(_ a:Int, _ b:Int) -> Int64 {
        var sum: Int64 = 0
        var min = 0
        var max = 0
        
        if a <= b {
            min = a
            max = b
        } else {
            min = b
            max = a
        }
        
        for target in min...max {
            sum += Int64(target)
        }
        return sum
    }
}


