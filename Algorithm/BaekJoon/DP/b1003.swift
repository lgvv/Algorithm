//
//  1003.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
// https://www.acmicpc.net/problem/1003
import Foundation

struct b1003 {
    
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        
        let input: Int! = Int(readLine()!) // 케이스 개수
        var list = [Int]() // 케이스
        
        for _ in 0..<input {
            list.append(Int(readLine()!)!)
        }
        
        var zero_one: [(Int, Int)] = [(Int, Int)](repeating: (0, 0), count: 41)
        zero_one[0] = (0, 1)
        zero_one[1] = (1, 0)
        
        for i in 2..<zero_one.count {
            zero_one[i].0 = zero_one[i-1].0 + zero_one[i-2].0
            zero_one[i].1 = zero_one[i-1].1 + zero_one[i-2].1
        }
        
        list.forEach { number in
            if number == 0 || number == 1 {
                print("\(zero_one[number].1) \(zero_one[number].0)")
            } else {
                let zero = zero_one[number-1].0 + zero_one[number-2].0
                let one = zero_one[number-1].1 + zero_one[number-2].1
                print("\(one) \(zero)")
            }
        }
        
    }
}
