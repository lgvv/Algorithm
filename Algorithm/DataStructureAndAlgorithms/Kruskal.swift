//
//  Kruskal.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/16.
//

import Foundation

/// 모든 정점에 대한 정보, edges는 연결관계(비용, 시작정점, 도착정점) -> 최소신장트리를 만족하는 연결정보를 리스트로 반환
func kruskal(vertices: [String], edges: [(Int, String, String)]) -> [(Int, String, String)] {
    var mst: [(Int, String, String)] = []
    
    var edges = edges.sorted { $0.0 < $1.0 }
    var rank: [String: Int] = [:]
    var parent: [String: String] = [:]
    
    for vertice in vertices {
        rank.updateValue(0, forKey: vertice)
        parent.updateValue(vertice, forKey: vertice)
    }
    
    func find(_ node: String) -> String {
        if node != parent[node]! {               // 루트 노드 찾아야만 재귀 탈출
            parent[node] = find(parent[node]!)
        }
        return parent[node]!
    }
    
    func union(_ nodeV: String, _ nodeU: String) {
        let rankV = find(nodeV)
        let rankU = find(nodeU)
        
        if rankV > rankU {
            parent[rankU] = rankV
        } else {
            parent[nodeV] = nodeU
            if rankV == rankU {
                rank[nodeU]! += 1
            }
        }
    }
    
    while mst.count < (vertices.count - 1) {
        let node = edges.removeFirst()
        if find(node.1) != find(node.2) {
            union(node.1, node.2)
            mst.append(node)
        }
    }
    return mst
}

struct Kruskal_Module {
    
    static let vertices = ["1","2","3","4","5","6","7"]
    static let edges = [
        (29, "1", "2"),
        (75, "1", "5"),
        (35, "2", "3"),
        (34, "2", "6"),
        (7, "3", "4"),
        (23, "4", "6"),
        (13, "4", "7"),
        (53, "5", "6"),
        (25, "6", "7")
    ]
    
    static func run() {
        let answer = kruskal(vertices: vertices, edges: edges)
        print(answer)
    }
}
