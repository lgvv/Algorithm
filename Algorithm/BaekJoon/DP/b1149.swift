//
//  b1149.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
// https://www.acmicpc.net/problem/1149
import Foundation

struct b1149 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        var list = [[Int]]()
        for _ in 0..<input {
            list.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
        }
        // 프로그래머스 땅따먹기 문제랑 비슷하네!
        
        for i in 1..<list.count {
            list[i][0] += min(list[i-1][1], list[i-1][2])
            list[i][1] += min(list[i-1][0], list[i-1][2])
            list[i][2] += min(list[i-1][0], list[i-1][1])
        }
        
        print(list.last!.min()!)
    }
}
