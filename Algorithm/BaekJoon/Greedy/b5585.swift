//
//  5585.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/21.
//

// https://www.acmicpc.net/problem/5585
// 그리디
import Foundation

struct b5585 {
    static func run() {
        let coins = [500, 100, 50, 10, 5, 1]
        var count = 0
        
        var input: Int! = Int(readLine()!)! // 1..<1000 정수
        input = 1000 - input
        
        for coin in coins {
            count += input / coin
            input %= coin
        }
        
        print(count)
    }
}

