//
//  68644.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/68644
import Foundation

struct p68644 {
    static func run() {
        print(p68644.solution([2,1,3,4,1])) // [2,3,4,5,6,7]
    }

    static func solution(_ numbers:[Int]) -> [Int] {
        var answer = [Int]()
        
        for i in 0..<numbers.count {
            let standard = numbers[i]
            
            for j in i+1..<numbers.count {
                let next = numbers[j]
                
                let sum = standard + next
                
                if !answer.contains(sum) {
                    answer.append(sum)
                }
            }
        }
        
        return answer.sorted(by: <)
    }
}

