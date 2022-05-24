//
//  b1516.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/24.
//
//https://www.acmicpc.net/problem/1516
import Foundation

struct b1516 {
    static func run() {
        // input은 건물의 개수
        let input = Int(readLine()!)!
        
        var graph = [Int: [Int]]() // 선수 건물에 대한 정보
        var indegree = [Int](repeating: 0, count: input+1) // 진입차수 정보
        indegree[0] = -1 // 건물번호 1번부터라 index바로 사용하려고
        
        var time = [Int](repeating: 0, count: input+1)
        time[0] = 0 // 건물번호 1번부터라서 인덱스를 그냥 바로 사용하기 위함
        
        for i in 1...input {
            let info = readLine()!.split(separator: " ").map { Int(String($0))! }
            time[i] = info[0]
            
            info[1..<info.count-1].forEach {
                if $0 != -1 {
                    if graph[$0] == nil {
                        graph[$0] = [i]
                    } else {
                        graph[$0]!.append(i)
                    }
                    
                    indegree[i] += 1
                }
            }
            
        }
        
//        print(graph)
//        print(indegree)
//        print("time \(time)")
        
        var queue = [Int]()
        indegree.enumerated().forEach {
            if $0.element == 0 {
                queue.append($0.offset)
            }
        }
        
//        print(queue)
        
        var result = [Int](repeating: 0, count: input+1)
        result[0] = 0 // 건물번호 1번부터라서 인덱스를 그냥 바로 사용하기 위함
        
        // 큐가 빌때까지
        queue.forEach { index in
            result[index] = time[index]
        }
        while !queue.isEmpty {
//            print("queue \(queue)")
            let now = queue.removeFirst()
            // 내 선수들의 합의 최솟값을 찾는다.
            
            
            
            // 해당원소와 연결된 노드들의 진입차수에서 -1
            if let sequence = graph[now] {
                let maxTime = max(time[now], result[now])
                
                for i in sequence {
                    indegree[i] -= 1
                    
                    if indegree[i] == 0 {
                        queue.append(i)
                    }
                    result[i] = max(result[i], (maxTime + time[i]))
                }
                
            }
            
        }
        
//        print(result)
        for item in result[1...] {
            print(item)
        }
        
    }
}

/*
 5
 10 -1
 20 1 -1
 30 2 -1
 40 3 5 -1
 100 -1
 */
