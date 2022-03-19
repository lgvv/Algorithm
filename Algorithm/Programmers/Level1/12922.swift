//
//  12922.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

//https://programmers.co.kr/learn/courses/30/lessons/12922
import Foundation

struct p12922 {
    static func run() {
        print(p12922.solution(1)) // "수박수"
    }

    static func solution(_ n:Int) -> String {
        let watermelon = "수박"
        
        var answer = ""
        for _ in 0..<n/2 {
            answer = "\(answer)\(watermelon)"
        }
        if n % 2 == 1 {
            answer = "\(answer)\(watermelon.first!)"
        }
        
        return answer
    }
}

