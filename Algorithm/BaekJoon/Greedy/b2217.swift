//
//  2217.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/2217
import Foundation

struct b2217 {
    static func run() {
        let iterator: Int! = Int(readLine()!)
        
        var rope_list: [Int] = []
        for _ in 0..<iterator {
            let rope: Int! = Int(readLine()!)
            rope_list.append(rope)
        }
        //정렬
        rope_list = rope_list.sorted(by: >)
//        print(rope_list)
        
        // 알고리즘 구현
        var max_weight = 0
        for i in 0..<rope_list.count {
            let weight = rope_list[i] * (i+1)
            max_weight = max(max_weight, weight)
        }
        print(max_weight)
    }
}
