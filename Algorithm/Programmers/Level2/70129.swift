//
//  70129.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/29.
//

//https://programmers.co.kr/learn/courses/30/lessons/70129
import Foundation

struct p70129 {
    static func run() {
        print(p70129.solution("110010101001")) // [3,8]
    }
    
    static func solution(_ s:String) -> [Int] {
        var s = s
        
        var removeCount = 0
        var totalCount = 0
        while s != "1" {
            let currentLength = s.count
            s = s.filter { $0 != "0" }
            removeCount += (currentLength - s.count)
            
//            print(removeCount)
            s = String(s.count, radix: 2)
//            print(s)
            totalCount += 1
        }
        
        
        
        return [totalCount, removeCount]
    }
}
