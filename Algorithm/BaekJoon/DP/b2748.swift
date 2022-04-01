//
//  b2748.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/02.
//
//https://www.acmicpc.net/problem/2748
import Foundation

struct b2748 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        var dp = [Int](repeating: 0, count: input+1)
        
        dp[0] = 0
        dp[1] = 1
        if input >= 2 {
            for i in 2..<input+1 {
                dp[i] = dp[i-1] + dp[i-2]
            }
        }
        print(dp.last!)
       
    }
}

