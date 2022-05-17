//
//  b1922.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/17.
//
// https://www.acmicpc.net/problem/1922
import Foundation

struct b1922 {
    static func run() {
        let v = Int(readLine()!)!

        let e = Int(readLine()!)!
        var graph: [[Int]] = []

        var parent = Array(0...v)

        
        func find(i: Int) -> Int {
            if parent[i] == i {
                return i
            } else {
                parent[i] = find(i: parent[i])
                return parent[i]
            }
        }

        func union(a: Int, b: Int) {
            let num1 = find(i: a)
            let num2 = find(i: b)

            // 무조건 병합해야해.
            if num1 < num2 {
                parent[num2] = num1
            } else {
                parent[num1] = num2
            }
        }
        
        // 2차원 배열로 세팅함.
        for _ in 0..<e {
            graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        }

        graph.sort { $0[2] < $1[2] }
        var result = 0
        for element in graph {
            let a = element[0]
            let b = element[1]
            let cost = element[2]

            if find(i: a) != find(i: b) {
                // 달라야 사이클이 아니다.
                result += cost
//                print(result)
                union(a: a, b: b)
            }
        }
        print(result)

    }
}
