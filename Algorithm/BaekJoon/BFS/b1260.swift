//
//  b1260.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/02.
//
//https://www.acmicpc.net/problem/1260
import Foundation

struct b1260 {
    static func run() {
        // Input 처리
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        var list = [Int: [Int]]()
        
        for _ in 0..<input[1] {
            let line = readLine()!.split(separator: " ").map(){Int(String($0))!}
            let start = line[0]
            let end = line[1]
            
            if list[start] == nil {
                list[start] = [end]
            } else {
                list[start]?.append(end)
            }
            
            if list[end] == nil {
                list[end] = [start]
            } else {
                list[end]?.append(start)
            }
        }
        
//        print("list \(list)")
        
        for key in list.keys {
            list[key] = list[key]?.sorted(by: >)
        }
//        print("list \(list)")
        var dfsResult = ""
        for i in DFS(graph: list, start: input[2]) {
            dfsResult += String(i) + " "
        }
        let dfsOffset = dfsResult.index(dfsResult.startIndex, offsetBy: dfsResult.count-1)
        print("\(dfsResult[..<dfsOffset])")
        
        for key in list.keys {
            list[key] = list[key]?.sorted(by: <)
        }
        var bfsResult = ""
        for i in BFS(graph: list, start: input[2]) {
            bfsResult += String(i) + " "
        }
        let bfsOffset = bfsResult.index(bfsResult.startIndex, offsetBy: bfsResult.count-1)
        print("\(bfsResult[..<bfsOffset])")
        
    }
}
