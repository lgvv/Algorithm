//
//  92335.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//

//https://programmers.co.kr/learn/courses/30/lessons/92335
import Foundation

struct p92335 {
    static func run() {
        print(p92335.solution(437674, 3)) // 3
        print(p92335.solution(110011, 10)) // 2
    }
    
    static func solution(_ n:Int, _ k:Int) -> Int {
        let binary: String = String(n, radix: k)
//        print(binary)
        var count = 0
        // 소수 판별 알고리즘 작성하기
        let list = binary.split(separator: "0")
//        print(list)
        
        list.forEach {
            let n = Int($0)!
            var flag = true
            
            if n == 1 { flag = false }
            else if n % 2 == 0 {
                if n == 2 { flag = true }
                else { flag = false }
            }
            else {
                for i in stride(from: 3, through: sqrt(Double(n)), by: 1) {
                    if n % Int(i) == 0 { flag = false }
                }
            }
            
            if flag { count += 1 }
            
        }
        
        return count
    }
}
