//
//  2579.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
//https://www.acmicpc.net/problem/2579
import Foundation

struct b2579 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        var list = [Int]()
        for _ in 0..<input {
            list.append(Int(readLine()!)!)
        }
        
        var dp = [Int](repeating: 0, count: 301)
        if input >= 1 {
            dp[0] = list[0]
        }
        if input >= 2 {
            dp[1] = list[0] + list[1]
        }
        if input >= 3 {
            dp[2] = max(list[0] + list[2], list[1] + list[2])
            for i in 3..<list.count {
                dp[i] += max(dp[i-2] + list[i] , dp[i-3] + list[i] + list[i-1])
            }
        }
        
        
        print(dp[input-1])
    }
}
