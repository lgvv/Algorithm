//
//  b1238.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/11.
//
// https://www.acmicpc.net/problem/1238
import Foundation

struct b1238 {
    static func run() {
        let input = readLine()!.split(separator: " ")
        var graph = [String: [String: Int]]()
        
        for _ in 0..<Int(input[1])! {
            let item = readLine()!.components(separatedBy:" ")
            let start = String(item[0])
            let end = String(item[1])
            let cost = Int(item[2])!
            
            if graph[item[0]] == nil {
                graph[start] = [end: cost]
            } else {
                var a = graph[start]!
                a[end] = cost
                graph[start] = a
            }
        }
        
//        print(graph)
        
        var timeList = [Int](repeating: 0, count: Int(input[0])! + 1)
        
        // 갈때
        for n in 1...Int(input[0])! {
            let answer = dijkstra(graph: graph, start: String(n))
            timeList[n] = answer[String(input[2])]!
        }
        
//        print(timeList)
        
        // 돌아올 때
        let answer = dijkstra(graph: graph, start: String(input[2]))
        answer.forEach {
            timeList[Int($0)!] += $1
        }
//        print(timeList)
        print(timeList.max()!)
        
        
    }
}
