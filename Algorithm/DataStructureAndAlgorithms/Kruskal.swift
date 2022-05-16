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
        // answer에서 나온 값의 합을 검증
        var sum = 0
        for element in answer { sum += element.0 }
        print(sum)
        
        
        let answerValue = kruskalValue(vertices: vertices, edges: edges)
        print(answerValue)
        
        // 크루스칼 싱글
        var graph: [[Int]] = [[1,2,38],[1,3,25],[2,4,38],[3,4,17],[3,5,26],[5,4,42],[5,6,9],[6,4,15],[4,7,19],[6,7,51]]
        print(kruskalSingle(graph: &graph, edgeCount: 7))

        
    }
}

/// 모든 정점에 대한 정보, edges는 연결관계(비용, 시작정점, 도착정점) -> 최소신장트리를 만족하는 최소 값을 반환
func kruskalValue(vertices: [String], edges: [(Int, String, String)]) -> Int {
    
    var mst: [(Int, String, String)] = []
    var edges = edges.sorted { $0.0 < $1.0 }
    var rank: [String: Int] = [:]
    var parent: [String: String] = [:]
    
    var result = 0
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
            result += node.0
        }
    }
    
    return result
}


// https://icksw.tistory.com/97
/// graph는 2차원 배열이며 각 원소는 [시작, 끝, 코스트]입니다. edgeCount는 정점의 개수입니다.
func kruskalSingle(graph: inout [[Int]], edgeCount: Int) -> Int {
    // 부모 노드를 찾는 함수
    func getParent(_ array: inout [Int], _ index: Int) -> Int {
        
        if array[index] == index {
            return index
        } else {
            array[index] = getParent(&array, array[index])
            return array[index]
        }
    }
    
    
    // 부모 노드를 합치는 함수
    func unionParent( _ array: inout [Int], _ a: Int, _ b: Int) {
        let num1 = getParent(&array, a)
        let num2 = getParent(&array, b)
        
        if a < b {
            array[num2] = num1
        } else {
            array[num1] = num2
        }
    }
    
    var result: Int = 0
    var parentNodeTable: [Int] = []
    
    // 추가된 간선 수
    var lines: Int = 0
    
    // 간선을 가중치 순으로 나열 - 오름차순 정렬
    graph.sort { (a, b) -> Bool in
        return a[2] < b[2]
    }
    
    // 부모 테이블 초기 셋팅
    for i in 0...edgeCount{
        parentNodeTable.append(i)
    }
    
    for index in 0..<graph.count{
        
        // 추가된 간선수가 정점 수 - 1이면 반복 중단
        if lines == edgeCount - 1{ break }
        
        // 만약 부모가 다르다면 사이클을 발생하지 않기 때문에 간선 추가
        if getParent(&parentNodeTable, graph[index][0]) != getParent(&parentNodeTable, graph[index][1]) {
            result += graph[index][2]
            lines += 1
            
            // 부모 노드 합침
            unionParent(&parentNodeTable, graph[index][0], graph[index][1])
        }
    }
    
    return result
}

//https://www.acmicpc.net/problem/1647
/// 크루스칼 알고리즘을 사용하여 최소 신장 트리를 2개로 나누고, 나눈 최소값을 반환합니다.
func kruskalDivide(graph: inout [[Int]], edgeCount: Int) -> Int {
    // 부모 노드를 찾는 함수
    func getParent(_ array: inout [Int], _ index: Int) -> Int {
        
        if array[index] == index {
            return index
        } else {
            array[index] = getParent(&array, array[index])
            return array[index]
        }
    }
    
    
    // 부모 노드를 합치는 함수
    func unionParent( _ array: inout [Int], _ a: Int, _ b: Int) {
        let num1 = getParent(&array, a)
        let num2 = getParent(&array, b)
        
        if a < b {
            array[num2] = num1
        } else {
            array[num1] = num2
        }
    }
    
    var result: Int = 0
    var parentNodeTable: [Int] = []
    
    // 추가된 간선 수
    var lines: Int = 0
    
    // 간선을 가중치 순으로 나열 - 오름차순 정렬
    graph.sort { (a, b) -> Bool in
        return a[2] < b[2]
    }
    
    // 부모 테이블 초기 셋팅
    for i in 0...edgeCount{
        parentNodeTable.append(i)
    }
    
    var last = 0
    for index in 0..<graph.count{
        
        // 추가된 간선수가 정점 수 - 1이면 반복 중단
        if lines == edgeCount - 1{ break }
        
        // 만약 부모가 다르다면 사이클을 발생하지 않기 때문에 간선 추가
        if getParent(&parentNodeTable, graph[index][0]) != getParent(&parentNodeTable, graph[index][1]) {
            result += graph[index][2]
            last = graph[index][2]
            lines += 1
            
            // 부모 노드 합침
            unionParent(&parentNodeTable, graph[index][0], graph[index][1])
        }
    }
    
    return result - last
}
