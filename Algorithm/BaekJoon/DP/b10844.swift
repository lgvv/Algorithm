//
//  B10844.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/02.
//
//https://www.acmicpc.net/problem/10844
import Foundation

struct b10844 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 11), count: input+1)
//        print(dp)
        
        for i in 1...9 {
            dp[1][i] = 1
        }
        
        for N in 2..<input+1{
            for L in 0...9 {
                if L == 0 {
                    dp[N][L] = dp[N-1][L+1] % 1000000000
                } else if L == 9 {
                    dp[N][L] = dp[N-1][L-1] % 1000000000
                } else {
                    dp[N][L] = (dp[N-1][L-1] + dp[N-1][L+1]) % 1000000000
                }
            }
        }
        
        var sum = 0
        dp[input].forEach {
            sum += $0
        }
        print(sum % 1000000000)
    }
}
