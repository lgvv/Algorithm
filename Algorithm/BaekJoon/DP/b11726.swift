//
//  b11726.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
//https://www.acmicpc.net/problem/11726
import Foundation

struct b11726 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        
        let input: Int! = Int(readLine()!)
        
        var dp: [Int] = [Int](repeating: 0, count: 1001)
        dp[1] = 1
        dp[2] = 2
        
        if input >= 3 {
            for i in 3...input {
                dp[i] = (dp[i-1] % 10007) + (dp[i-2] % 10007)
            }
        }
        
        print(dp[input] % 10007)
    }
}
