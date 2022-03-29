//
//  12945.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/29.
//

//https://programmers.co.kr/learn/courses/30/lessons/12945
import Foundation

struct p12945 {
    static func run() {
        print(p12945.solution(3)) // 2
    }
    
    static func solution(_ n:Int) -> Int {
        // DP를 이용하는 문제군요!
        var visited: [Int] = [Int](repeating: -1, count: n+1)
//        print(visited)
        visited[0] = 0
        visited[1] = 1
        
        for i in 2...n {
            visited[i] = (visited[i-1] % 1234567) + (visited[i-2] % 1234567)
        }
        
//        print(visited[n].truncatingRemainder(dividingBy: 1234567))
        
        return visited[n] % 1234567
    }
}

