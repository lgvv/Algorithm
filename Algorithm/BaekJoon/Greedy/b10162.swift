//
//  b10162.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/10162
import Foundation

struct b10162 {
    static func run() {
        let times = [300, 60, 10] // second
        
        var input: Int! = Int(readLine()!)
        
        // 알고리즘 구현
        if input % 10 != 0 {
            print("-1")
            
        } else {
            var answer = [Int]()
            for time in times {
                answer.append(input / time)
                input = input % time
            }
            var answer_string = answer.map {
                "\($0)"
            }.joined(separator: " ")
            
            print(answer_string)
        }
        
    }
}

