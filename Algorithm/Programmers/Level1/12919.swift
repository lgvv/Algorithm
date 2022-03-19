//
//  12919.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/12919
import Foundation

struct p12919 {
    static func run() {
        print(p12919.solution(["Jane", "Kim"])) // "김서방은 1에 있다"
    }

    static func solution(_ seoul:[String]) -> String {
        let idx = seoul.firstIndex(of: "Kim")
        
        return "김서방은 \(idx!)에 있다"
    }
}

