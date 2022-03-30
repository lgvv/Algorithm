//
//  DFS.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//

import Foundation

func DFS<T> (graph: [T: [T]], start: T) -> [T] {
    var visitedQueue: [T] = []
    var needVisitStack: [T] = [start]
    
    while !needVisitStack.isEmpty {
        let node: T = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
}

struct DFS_Module {
    static let graph: [String: [String]] = [
        "A" : ["B", "C"],
        "B" : ["A", "D", "E"],
        "C" : ["A", "F"],
        "D" : ["B"],
        "E" : ["B"],
        "F" : ["C"],
    ]
    
    static func run() {
        print(DFS(graph: graph, start: "A")) // ["A", "C", "F", "B", "E", "D"]
    }
}
