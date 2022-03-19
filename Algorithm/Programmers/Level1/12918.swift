//
//  12918.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/12918
import Foundation

struct p12918 {
    static func run() {
        print(p12918.solution("a234")) // false
        
    }

    static func solution(_ s:String) -> Bool {
        let pass = [4,6]
        
        guard pass.contains(s.count) else { return false }
        for c in s {
            guard c.isNumber else { return false }
        }
        
        return true
    }
}


