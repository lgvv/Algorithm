//
//  42889.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/42889
// https://rldd.tistory.com/322
import Foundation

struct p42889 {
    static func run() {
//        print(p42889.solution(5, [2, 1, 2, 6, 2, 4, 3, 3])) // [3,4,2,1,5]
        print(p42889.solution(4, [4,4,4,4,4])) // [4,1,2,3]
    }

    static func solution(_ N:Int, _ stages:[Int]) -> [Int] {
        var tuple = [(Int, Double)]() // [스테이지: 실패율]
        var player = stages.count
        
        // filter보다 for문이 빠름
        for i in 1...N {
            var current = 0
            for j in 0..<stages.count {
                if stages[j] == i {
                    current += 1
                }
            }
            
            player -= current
            
            var ratio = Double(current) / Double(player)
            tuple.append((i, ratio))
        }
        print(tuple)

        tuple = tuple.sorted(by: {$0.1 > $1.1 })
        
        return tuple.map{ $0.0 }
    }
}
