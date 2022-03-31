//
//  b9095.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
//https://www.acmicpc.net/problem/9095
import Foundation

struct b9095 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        
        let input: Int! = Int(readLine()!) // 케이스 개수
        var list = [Int]() // 케이스
        
        for _ in 0..<input {
            list.append(Int(readLine()!)!)
        }
        
        var dp = [Int](repeating: 0, count: 10)
        dp[0] = 1
        dp[1] = 2
        dp[2] = 4
        
        list.forEach {
            if $0 > 2 {
                for i in 3..<$0 {
                    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
                }
            }
            print(dp[$0-1])
        }
    }
}
