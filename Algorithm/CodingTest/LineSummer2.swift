//
//  LineSummer2.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/28.
//

import Foundation

struct LineSummer2 {
    static func run() {
        print(LineSummer2.solution(4, [2,3])) // 5
        print(LineSummer2.solution(5, [2,4,5])) // 8
        print(LineSummer2.solution(6, [1,2,3])) // 5
    }
    
    static func solution(_ n:Int, _ times:[Int]) -> Int {
        // dp써야한다.
//        var result = 0
        var dp = [Int](repeating: 0, count: 2001) // n의 수만큼
        dp[2] = times[0]
        
        for i in 2...n {
            for j in (i+1)...(i*2) {
                if (j - i) <= times.count {
//                    print("i\(i) | \(j)")
                    
                    if dp[j] == 0 {
                        dp[j] = dp[i] + times[(j-i-1)]
                    }
                    
                    
                } else {
                    break
                }
            }
        }
        
        for i in 0...n {
            print("dp[\(i)] \(dp[i])")
        }
        
//        print(dp)
        
        return dp[n]
    }
    
    
}
