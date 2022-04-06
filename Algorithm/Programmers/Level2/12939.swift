//
//  12939.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/06.
//
//https://programmers.co.kr/learn/courses/30/lessons/12939
import Foundation

struct p12939 {
    static func run() {
        print(p12939.solution("1 2 3 4")) // "1 4"
    }

    static func solution(_ s:String) -> String {
        let s = s.components(separatedBy: " ").map { Int("\($0)")! }
        return "\(s.min()!) \(s.max()!)"
    }
}
