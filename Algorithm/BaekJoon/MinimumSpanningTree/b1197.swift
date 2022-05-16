//
//  b1197.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/16.
//

import Foundation

struct b1197 {
    static func run() {
        let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
        let v = firstLine[0] // 정점의 개수
        let e = firstLine[1] // 간선의 개수
        var parent = Array(0...v)
        var graph: [[Int]] = []
        var result = 0
        
        // 루트 노드를 찾는 함수
        func findParent(_ index: Int) -> Int {
            if parent[index] == index { return index } // 부모의 인덱스가 나와 같으면 그대로 반환
            else { // 부모의 인덱스가 나와 다르면 루트노드가 있다는 의미이므로 재귀적으로 다시 찾기
                parent[index] = findParent(parent[index])
                return parent[index] // 결국 최종적으로는 루트 노드의 index를 반환한다!
            }
            
        }
        
        // 루트 노드를 합치는 함수
        func unionParent(_ a: Int, _ b: Int) {
            let num1 = findParent(a)
            let num2 = findParent(b)
            if a < b { parent[num2] = num1 } // 더 인덱스가 작은 루트 노드를 갖게끔 병합
            else { parent[num1] = num2 }
        }
        
        // 2차원 배열로 세팅함.
        for _ in 0..<e {
            graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        graph.sort { $0[2] < $1[2] }
        
        for index in 0..<graph.count {
            // 시작노드와 끝노드를 넣어서 사이클이 만들어지는지 확인.
            if findParent(graph[index][0]) != findParent(graph[index][1]) { // 사이클이 만들어지지 않는 경우에만
                result += graph[index][2] // 비용 증가
                unionParent(graph[index][0], graph[index][1]) }
        }
        
        print(result)
    }
}
