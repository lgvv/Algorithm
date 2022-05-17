//
//  b4386.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/17.
//
// https://www.acmicpc.net/problem/4386
import Foundation

struct b4386 {
    static func run() {
        let v = Int(readLine()!)! // 별의 갯수

        var input: [[Double]] = [] // [x,y] 좌표들의 list
        var parent = Array(0...v) //
        
        // 2차원 배열로 세팅함.
        for _ in 0..<v {
            input.append(readLine()!.split(separator: " ").map { Double($0)! })
        }
        
//        print(parent)
        
        var graph = [[Double]]()
        for i in 0..<input.count {
            let pointA = input[i]
            
            for j in i..<input.count {
                let pointB = input[j]
                if pointA == pointB { continue }
                
                
                let x = pointA[0] - pointB[0]
                let y = pointA[1] - pointB[1]
                let distance = sqrt(x*x + y*y)
                
                let item = [Double(i+1), Double(j+1), distance]
                graph.append(item)
            }
        }
//        print(graph.count)
        graph.sort { $0[2] < $1[2] }
//        print(graph)
        
        var result: Double = 0
        graph.forEach { element in
            let a = element[0]
            let b = element[1]
            let cost = element[2]
            
            if find(index: Int(a)) != find(index: Int(b)) {
                result += cost
                union(a: Int(a), b: Int(b))
            }
            
        }
        print(result)
        
        func find(index: Int) -> Int {
            if parent[index] == index {
                return index
            } else {
                parent[index] = find(index: parent[index])
                return parent[index]
            }
        }

        func union(a: Int, b: Int) {
            let num1 = find(index: a)
            let num2 = find(index: b)
            
            if num1 < num2 {
                parent[num2] = num1
            } else {
                parent[num1] = num2
            }
        }
        
        
    }
}
