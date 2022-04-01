//
//  b1912.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/01.
//
//https://www.acmicpc.net/problem/1912
import Foundation

struct b1912 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        let list: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
        var dp = [Int](repeating: 0, count: input)
        
        dp[0] = list[0]
        
        if input >= 2 {
            dp[1] = max(dp[0]+list[1], list[1])
            
            for i in 2..<input {
                let value = max(dp[i-1],list[i-1])
                
                if value > list[i] || value > 0 {
                    dp[i] = list[i] + value
                } else {
                    dp[i] = list[i]
                }
            }
        }
        
        print(dp.max()!)
    }
}
