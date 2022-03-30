//
//  17687.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
// https://programmers.co.kr/learn/courses/30/lessons/17687
import Foundation

struct p17687 {
    static func run() {
//        print(p17687.solution(2,4,2,1)) // "0111"
//        print(p17687.solution(16,16,2,1)) // "02468ACE11111111"
        print(p17687.solution(16,16,2,2)) // "13579BDF01234567"
    }

    static func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
        var answer = ""
        var number = 0
        var turn = 0
        
        while answer.count < t {
            let binary = String(number, radix: n)
//            print(" -> \(binary)")
            
            var p = p
            if p == m { p = 0 }
            
            for i in 0..<binary.count {
                let index = binary.index(binary.startIndex, offsetBy: i)
                turn += 1
                
                if turn % m == p {
//                    print(" \(turn) | \(m) | \(p) | \(binary[index]))")
                    if binary[index].isLetter {
                        answer += "\(binary[index].uppercased())"
                    } else {
                        answer += "\(binary[index])"
                    }
                    
                }
                
                
                if answer.count >= t { return answer }
            }
            number += 1
        }
        
//        print("answer \(answer)")
        return answer
    }
}
