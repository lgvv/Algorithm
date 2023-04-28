//
//  12973.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/06/13.
//
//https://programmers.co.kr/learn/courses/30/lessons/12973
import Foundation

struct p12973 {
    
    static func run() {
//        print(p12973.solution("baabaa")) // 1
        print(p12973.solution("cdcd")) // 0
    }
    
    static func solution(_ s:String) -> Int{
        var answer: Int = -1

        // 스택을 사용합시다.
        var stack: String = ""
        
        for i in 0..<s.count {
            let index = s.index(s.startIndex, offsetBy: i)
            let c = s[index]
            
            
        }
        
        return answer
    }
}
