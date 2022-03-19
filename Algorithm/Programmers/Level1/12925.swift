//
//  12925.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/12925
import Foundation

struct p12925 {
    static func run() {
        print(p12925.solution("-1234")) // 1234
    }

    static func solution(_ s:String) -> Int {
        var s = s
        if s.first! == "-" {
            s.removeFirst()
            return -Int(s)!
        }
        
        return Int(s)!
    }
}
