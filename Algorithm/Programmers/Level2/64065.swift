//
//  64065.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//
//https://programmers.co.kr/learn/courses/30/lessons/64065
import Foundation

struct p64065 {
    static func run() {
        print(p64065.solution("{{4,2,3},{3},{2,3,4,1},{2,3}}")) // [3, 2, 4, 1]
    }
    
    static func solution(_ s:String) -> [Int] {
        // 정규 표현식으로 값 분리
        var s = s
        s.removeFirst(2)
        s.removeLast(2)
        
        var list = [Int]()
        s.components(separatedBy: "},{")
            .map { $0.components(separatedBy: ",").map { Int($0)! } }
            .sorted { $0.count < $1.count }
            .forEach { elements in
                elements.forEach { element in
                    if !list.contains(element) {
                        list.append(element)
                    }
                }
            }
        
        return list
    }
}
