//
//  b1916.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/10.
//
// https://www.acmicpc.net/problem/1916
import Foundation

struct b1916 {
    static func run() {
        let n = Int(readLine()!)!
        var cities = [[(end: Int, value: Int)]](repeating: [], count: n+1) // label을 달아서 배열 생성
        for _ in 0..<Int(readLine()!)! {
            let d = readLine()!.split(separator: " ").map { Int(String($0))! }
            cities[d[0]].append((d[1], d[2]))
        }
        print(cities)
        let se = readLine()!.split(separator: " ").map { Int(String($0))! }

        var visited = [Bool](repeating: false, count: n+1)
        visited[0] = true

        var graph = [Int](repeating: Int.max, count: n+1)
        graph[se[0]] = 0 // 시작점은 0으로
        visit(se[0])

        func visit(_ current: Int) {
            guard current != se[1] else { return } // 찾는 곳에 도달했다면
            
            visited[current] = true
            for (end, value) in cities[current] {
                graph[end] = min(graph[end], graph[current] + value) // 다익스트라 알고리즘에 의해 업데이트
            }
            
            let next = graph.enumerated()
                .filter({ !visited[$0.offset] }) // 방문하지 않은 노드이면서
                .min(by: { $0.element < $1.element })!.offset // 정렬 했을때 거리가 가장 가까운거 부터 수행
            visit(next) // reculsive!
        }

        print(graph[se[1]])
    }
    
}
