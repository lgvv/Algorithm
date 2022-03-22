//
//  b1931.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/1931
import Foundation

struct b1931 {
    static func run() {
        // 인풋 필드
        let iterator : Int! = Int(readLine()!)! // 1..<100000 정수
        
        var time_list: [(Int, Int)] = []
        for _ in 0..<iterator {
            let input = readLine()!.split(separator: " ")
            let start: Int = Int(input[0])!
            let end: Int = Int(input[1])!
            time_list.append((start, end))
        }
        
        // 정렬
        time_list = time_list.sorted {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            }
            return $0.1 < $1.1
        }
        
        // 알고리즘 구현
//        print(time_list)
        var currentTime = 0
        var count = 0
        time_list.forEach { start, end in
            if start >= currentTime { // 회의 가능한 케이스
//                print("-> \(start) \(end)")
                count += 1
                currentTime = end
            }
        }
        print(count)
        
    }
}

// 반례 3 [3 3, 2 3, 3 3]
