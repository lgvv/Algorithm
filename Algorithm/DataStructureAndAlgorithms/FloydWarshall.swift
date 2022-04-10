//
//  FloydWarshall.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/10.
//

import Foundation

/// 정점간의 연결관계, 가중값, 정점의 개수
func FloydWarshall(graph: [[Int]], weight: [Int], n: Int) -> [[Int]] {
    var node = [[Int]](repeating: [Int](repeating: Int(1e9), count: n), count: n)

    for i in 0..<graph.count {
        let x = graph[i][0] - 1
        let y = graph[i][1] - 1
        
        node[x][y] = weight[i]
    }
    
    for i in 0..<n {
        node[i][i] = 0
    }
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                node[j][k] = min(node[j][i] + node[i][k], node[j][k])
            }
        }
    }
    
    return node
}

struct FloydWarshall_Module {
    
    static let graph = [[1,2], [1,4], [2,1], [2,3], [3,1], [3,4], [4,3]]
    static let weight = [4, 6, 3, 7, 5, 4, 2]
    
    static func run(n: Int) {
        let answer = FloydWarshall(graph: graph, weight: weight, n: 4) // [[0, 4, 8, 6], [3, 0, 7, 9], [5, 9, 0, 4], [7, 11, 2, 0]]
        print(answer)
    }
}

