//
//  b11053.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/01.
//
//https://www.acmicpc.net/problem/11053
import Foundation

struct b11053 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        let input2 = readLine()
        var list = [Int]()
        
        list = input2!.components(separatedBy: " ").map{ Int($0)! }
        
        var dp = [Int](repeating: 1, count: 1001)
            
        for i in 0..<list.count {
            for j in 0..<i {
                if list[j] < list[i] {
                    dp[i] = max(dp[i], dp[j]+1)
                }
            }
        }
        print(dp)
        print(dp.max()!)
        
    }
}
