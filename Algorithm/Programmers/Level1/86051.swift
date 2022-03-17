//
//  86051.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/86051
import Foundation

struct p86051 {
    static func run() {
        print(p86051.solution([1,2,3,4,6,7,8,0])) // 14
    }

    static func solution(_ numbers:[Int]) -> Int {
        var sum = 0
        for i in 1...9 {
            if !numbers.contains(i) {
                sum += i
            }
        }
        return sum
    }
}
