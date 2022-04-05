//
//  b11724.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/05.
//
//https://www.acmicpc.net/problem/11724
import Foundation

struct b11724 {
    static func run() {
        let info = readLine()!.split(separator: " ").map{ Int("\($0)")! }
        var list = [Int: [Int]]()
        var keys: Set = Set<Int>()
        
        for _ in 0..<info[1] {
            let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let start = line[0]
            let end = line[1]
            
            if list[start] == nil {
                list[start] = [end]
                keys.insert(start)
            } else {
                list[start]?.append(end)
            }
            
            if list[end] == nil {
                list[end] = [start]
                keys.insert(end)
            } else {
                list[end]?.append(start)
            }
        }
        
        var count = info[0] - keys.count
        
        while !keys.isEmpty {
            count += 1
            // DFS
            var visitedQueue = [Int]()
            var needVisitStack = list[keys.first!]!
            
            while !needVisitStack.isEmpty {
                let node: Int = needVisitStack.removeLast()
                if visitedQueue.contains(node) { continue }
                keys.remove(node)
                
                visitedQueue.append(node)
                needVisitStack += list[node] ?? []
            }
            
            keys.subtract(visitedQueue)
        }
        

        print(count)
    }
}
