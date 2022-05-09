//
//  Kakao2.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/07.
//

import Foundation

// ~ 3시 10분
struct kakao2 {
    static func run() {
        print(kakao2.solution([3, 2, 7, 2], [4, 6, 5, 1])) // 2
        print(kakao2.solution([1, 2, 1, 2], [1, 10, 1, 2])) // 7
        print(kakao2.solution([1, 1], [1, 5])) // -1
        print(kakao2.solution([1, 1, 1], [1, 1, 2])) // -1
    }
    
    // 200000 시초: 22 23 24
    // 130000 시초: 22 23 24, 30 fail
    // index알고리즘: 22 24 30 fail
    // index알고리즘 + 200000: 22 24 fail
    // index알고리즘 + 1000000: 통과~!
    static func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
        var queue1 = queue1
        var queue2 = queue2
        
        var sum1: Double = 0 // 나중에 overflow double로 변경
        var sum2: Double = 0 // 나중에 overflow double로 변경
        
        var index1 = 0 // pop 수행보다 인덱스 참조가 더 빠르므로
        var index2 = 0 // pop 수행보다 인덱스 참조가 더 빠르므로
        
        queue1.forEach { sum1 += Double($0) }
        queue2.forEach { sum2 += Double($0) }
        
        var count = 0 // 몇번을 수행하는지
        
        let repeatCount = 1000000
        while count < repeatCount {
//            if queue1.count >= index1 || queue2.count >= index2 { return -1 }
            if sum1 == sum2 { break }
            count += 1
            
            if sum1 > sum2 {
                let pop: Double = Double(queue1[index1])
                index1 += 1
                queue2.append(Int(pop))
                sum1 -= pop
                sum2 += pop
            } else if sum1 < sum2 {
                let pop: Double = Double(queue2[index2])
                index2 += 1
                queue1.append(Int(pop))
                sum1 += pop
                sum2 -= pop
            }
        }
//        print("\(count) count")
        if count == repeatCount { return -1}
        return count
    }
}
