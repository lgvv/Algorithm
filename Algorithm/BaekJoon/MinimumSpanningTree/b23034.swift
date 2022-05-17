//
//  b17472.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/17.
//
// https://www.acmicpc.net/problem/23034
import Foundation

// MARK: - 실패한 문제 (시간초과)
struct b23034 {
    static func run() {
        
        
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        
        var graph = [[Int]]()
        for _ in 0..<input[1] {
            graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        let questionCount = Int(readLine()!)!
        var questions = [(Int, Int)]()
        for _ in 0..<questionCount {
            let info = readLine()!.split(separator: " ").map { Int($0)! }
            questions.append((info[0], info[1]))
        }
        
        //        print(graph)
        //        print(questions)
        
        // N명의 학생만큼 부모 테이블 세팅
        var parent = Array(0...input[0])
        graph.sort { $0[2] < $1[2] }
        
        var result = 0
        graph.forEach {
            let a = $0[0]
            let b = $0[1]
            let cost = $0[2]
            
            // 사이클이 없다면
            if find(index: a) != find(index: b) {
                result += cost
                union(a: a, b: b)
            }
        }
        
        questions.forEach { question in
            var cost = 0
            
            for item in graph {
                if item[0] == question.0 && item[1] == question.1 {
                    cost = item[2]
                    break
                }
            }
            print(result - cost)
        }
        
        
        
        func find(index: Int) -> Int {
            if parent[index] == index {
                return index
            } else {
                parent[index] = find(index: parent[index])
                return parent[index]
            }
        }
        
        func union(a: Int, b: Int) {
            let num1 = find(index: a)
            let num2 = find(index: b)
            
            if num1 < num2 {
                parent[num2] = num1
            } else {
                parent[num1] = num2
            }
        }
    }
}
