//
//  86971.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/06.
//
//
//https://programmers.co.kr/learn/courses/30/lessons/86971
import Foundation

struct p86971 {
    static func run() {
        //        print(p86971.solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])) //3
//        print(p86971.solution(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]])) //1
        print(p86971.solution(4, [[1,2],[2,3],[3,4]])) //0
    }
    
    static func solution(_ n:Int, _ wires:[[Int]]) -> Int {
        var list = [Int :[Int]]()
        for i in 0..<wires.count {
            let start = wires[i][0]
            let end =  wires[i][1]
            
            if list[start] == nil {
                list[start] = [end]
            } else {
                list[start]?.append(end)
            }
            
            if list[end] == nil {
                list[end] = [start]
            } else {
                list[end]?.append(start)
            }
        }
        
        // 1. 전력망을 끊는다.
        // 2. DFS / BFS를 사용하여 방문한 지점을 카운팅한다.
        // 3. 최소값을 계산한다.
        var minValue = Int.max
        
        for i in 1...n {
            for _ in 1...list[i]!.count {
                let point = list[i]!.removeFirst()
                
                if point != i {
                    let count = DFS(graph: list, start: i).count
                    minValue = min(abs(n - count - count), minValue)
                }
                list[i]!.append(point)
            }
        }
        
        
        return minValue
    }
}
