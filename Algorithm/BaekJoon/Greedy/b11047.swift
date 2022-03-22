//
//  b11047.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/11047
import Foundation

struct b11047 {
    static func run() {
        // 인풋 필드
        let input = readLine()!.split(separator: " ")
        
        let iterator: Int = Int(input[0])!
        var amount: Int = Int(input[1])!
        
        var coins: [Int] = []
        
        for _ in 0..<iterator {
            let coin : Int! = Int(readLine()!)! // 1..<1000 정수
            coins.insert(coin, at: 0)
        }
        
//        print("iter \(iterator) amount \(amount) | \(coins)")
        
        // 알고리즘 구현
        var count = 0
        for coin in coins {
            count += amount / coin
            if amount / coin != 0 {
                amount %= coin
            }
        }
        print(count)
    }
}
