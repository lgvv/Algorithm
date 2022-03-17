//
//  12943.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/18.
//

//https://programmers.co.kr/learn/courses/30/lessons/12943
import Foundation

struct p12943 {
    static func run() {
        print(p12943.solution(6)) // 8
    }

    static func solution(_ num:Int) -> Int {
        var num = Double(num)
        var count = 0
        while(count<500) {
            if num == 1 { return count }
            count += 1
            
            if Int(num) % 2 == 0 { // 짝수
                num = num / 2
            } else { // 홀수
                num = num * 3 + 1
            }
        }
        
        return -1
    }
}
