//
//  Dijkstra.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/09.
//

import Foundation

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}

func dijkstra(graph: [String: [String: Int]], start: String) ->  [String: Int] {
    var distances: [String: Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : 2147483647
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(NodePriority.init(node: node, priority: distance))
            }
        }
    }
    return distances
}


struct dijkstra_Module {
    static let graph: [String: [String: Int]] = [
        "A" : ["B": 9, "C" : 1, "D" : 15],
        "B" : ["E": 10],
        "C" : ["B": 5, "E" : 3],
        "D" : ["E": 10],
        "E" : ["F": 7],
        "F" : [:]
    ]
    
    static func run() {
        print(dijkstra(graph: graph, start: "A")) // ["E": 4, "F": 11, "B": 6, "C": 1, "D": 15, "A": 0]
    }
}
