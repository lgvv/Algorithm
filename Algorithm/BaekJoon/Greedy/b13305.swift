//
//  13305.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

import Foundation

//https://www.acmicpc.net/problem/13305
import Foundation

struct b13305 {
    static func run() {
        let number: Int! = Int(readLine()!)
        let length = readLine()!.split(separator: " ").map { Int($0)! }
        let price = readLine()!.split(separator: " ").map { Int($0)! }
        
        // 어느 한 구간에서라도 더 저렴하게 살 수 있으면 거기를 기점으로 잡는다.
        // 그냥 한번 한번 진행하면 되겠다!
        
        var total = 0
        var lowPrice = price.first!
        for i in 0..<number-1 {
            // lowPrice와 currentPrce 가격 비교
            if lowPrice > price[i] {
                lowPrice = price[i]
            }
            total += lowPrice * length[i]
            
            
        }
        print(total)
    }
}
