//
//  1026.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/1026
import Foundation

struct b1026 {
    static func run() {
        let input: Int! = Int(readLine()!)
        let A = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
        let B = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
        
        //print(A)
        //print(B)
        
        // 알고리즘 구현
        var sum = 0
        for (a,b) in zip(A,B) {
            sum += a*b
        }
        print(sum)
        
    }
}
