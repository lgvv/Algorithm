//
//  b1647.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/16.
//

import Foundation

struct b1647 {
//    static func run() {
//        let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//
//        var parent = Array(0...firstLine[0]) // 부모노드 생성
//        for i in 0...firstLine[0] {
//            parent[i] = i
//        }
////        print(parent)
//
//        var edges = [(Int, Int, Int)]() // 시작, 끝, 비용
//        for _ in 0..<firstLine[1] {
//            let i = readLine()!.split(separator: " ").map { Int($0)! }
//            edges.append((i[0], i[1], i[2]))
//        }
//        edges.sort { $0.2 < $1.2 }
////        print(edges)
//
//        var result = 0
//        var last = 0
//        for edge in edges {
//
//            let a = find(parent: &parent, i: edge.1)
//            let b = find(parent: &parent, i: edge.0)
//
////            print("👉 edge \(edge) a: \(a) b: \(b)")
//            if a != b { // a와 b가 다르다면 사이클이 발생하지 않는다는 의미
//                result += edge.2
//                last = edge.2
////                print("✅ a: \(a) b: \(b) cost \(edge.2) result \(result)")
//                union(parent: &parent, start: edge.0, end: edge.1)
//            }
//        }
//        // 2개로 분할하는데, 그냥 가장 긴 경우 빼면 된다.
//        print(result - last)
//
//        // 루트노드를 찾습니다.
//        func find(parent: inout [Int], i: Int) -> Int {
//            if parent[i] == i { return i } // 같으면 루트 노드가 없다는 의미
//            else {
//                let answer = find(parent: &parent, i: parent[i])
//                return answer
//            }
//        }
//
//        // inout을 사용해서 & 처럼 사용
//        func union(parent: inout [Int], start: Int, end: Int) {
//            let num1 = find(parent: &parent, i: start)
//            let num2 = find(parent: &parent, i: end)
//
//            // 어찌되었든 합쳐야 함. 더 작은 수가 root로 전부 세팅
//            if start < end {
//                parent[num2] = num1
//            } else {
//                parent[num1] = num2
//            }
//        }
//    }
    
    static func run() {
        let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
        
        var graph: [[Int]] = []
        // 2차원 배열로 세팅함.
        for _ in 0..<firstLine[1] {
            graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        
        var a = kruskalDivide(graph: &graph, edgeCount: firstLine[0])
        print(a)
    }
}
