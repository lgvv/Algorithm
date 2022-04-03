//
//  b2606.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/03.
//
//https://www.acmicpc.net/problem/2606
import Foundation

struct b2606 {
    static func run() {
        // Input 처리
        var n = Int(readLine()!)!
        var input = Int(readLine()!)!
        
        var list = [Int: [Int]]()
        
        for _ in 0..<input {
            let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
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
        
//        print(list)
        let a = DFS(graph: list, start: 1)
        print(a.count-1)
    }
}
