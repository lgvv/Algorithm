//
//  62048.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/06/13.
//
// https://programmers.co.kr/learn/courses/30/lessons/62048
import Foundation

struct p62048 {
    
    static func run() {
        print(p62048.solution(8, 12))
    }
    
    static func solution(_ w:Int, _ h:Int) -> Int64 {
        var answer: Int64 = 0

        /*
         가장 작은 패턴을 찾습니다. - w와 h의 최대공약수! 만큼 반복된다.
         또한 N + M - 1 만큼의 버려지는 값이 생깁니다.
         */
        
        // 최대공약수 알고리즘
        func gcd(a: Int, b: Int) -> Int {
            var a = a
            var b = b
            
            while b != 0 {
                let r = a % b
                a = b
                b = r
            }
            return a
        }
        
        let gcdValue = gcd(a: w, b: h)
        let exclude = ((w / gcdValue) + (h / gcdValue)) - 1
        answer = Int64((w * h) - (exclude * gcdValue))
        
        return answer
    }
}
