//
//  b1932.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/01.
//

import Foundation


struct b1932 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int = Int(readLine()!)!
        var list = [[Int]]()
        var dp = [[Int]](repeating: [Int](repeating: 0, count: input), count: input)
        
        for _ in 0..<input {
            let v = readLine()!.components(separatedBy: " ").map { Int($0)! }
            list.append(v)
        }
//        print(list)
        dp[0][0] = list[0][0]
        
        if input >= 2 {
            dp[1][0] = dp[0][0] + list[1][0]
            dp[1][1] = dp[0][0] + list[1][1]
        
            for row in 2..<list.count {
                list[row].enumerated().forEach {
                    let col = $0.offset
                    if col == 0 { // 처음
                        dp[row][col] = dp[row-1][0] + list[row][0]
                    } else if col == list[row].count-1 { // 끝
//                        print("끝입니다. \(col)")
                        dp[row][col] = dp[row-1][col-1] + list[row][col]
                    } else {
                        let pivot = max(dp[row-1][col-1], dp[row-1][col])
                        dp[row][col] = pivot + list[row][col]
                    }
                }
            }
        }
        
        print(dp.last!.max()!)
    }
}
