//
//  BFS.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//

import Foundation

public func BFS<T> (graph: [T: [T]], start: T) -> [T] {
    var visitedQueue: [T] = []
    var needVisitQueue: [T] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: T = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    
    return visitedQueue
}

struct BFS_Module {
    static let graph: [String: [String]] = [
        "A" : ["B", "C"],
        "B" : ["A", "D", "E"],
        "C" : ["A", "F"],
        "D" : ["B"],
        "E" : ["B"],
        "F" : ["C"],
    ]
    
    static func run() {
        print(BFS(graph: graph, start: "A")) // ["A", "B", "C", "D", "E", "F"]
    }
}

