//
//  12941.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/28.
//

//https://programmers.co.kr/learn/courses/30/lessons/12941
import Foundation

struct p12941 {
    
    static func run() {
        print(p12941.solution([1, 4, 2], [5, 4, 4]))// 29
    }
    
    static func solution(_ A:[Int], _ B:[Int]) -> Int {
        
        let a = A.sorted(by: >)
        let b = B.sorted(by: <)
        
        var sum = 0
        for (a,b) in zip(a,b) {
            sum += a * b
        }
        
        return sum
    }
}
