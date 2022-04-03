//
//  b2667.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/03.
//
// https://www.acmicpc.net/problem/2667
import Foundation

struct b2667 {
    static func run() {
        let n = Int(readLine()!)!
        
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        for i in 0..<n {
            let v = readLine()!.compactMap { $0.wholeNumberValue! } // string을 손쉽게 [Int] 배열로 분리하는 코드
            matrix[i] = v
        }
        
        // 자기자리 + 상하좌우
        let dx = [0, -1, 1, 0, 0]
        let dy = [0, 0, 0, -1, 1]
        
        var queue = [[Int]]()
        var group = 0 // 만들어진 블럭의 갯수
        var count = 0 // 각 블럭의 갯수
        var answer = [Int]()
        
        for i in 0..<n { // 행우선 반복
            for j in 0..<n { // 열우선 반복
                
                if matrix[i][j] == 1 && visited[i][j] == false { // 그 행의 값이 1이고, 방문한 적이 없다면
                    // BFS 알고리즘을 채택함
                    queue.append([i,j]) // queue에 넣는다
                    
                    while !queue.isEmpty { // 큐가 비어있지 않다면 지속적으로 수행.
                        // 큐의 제일 앞의 값을 빼낸다.
                        let x = queue[0][0]
                        let y = queue[0][1]
                        
                        queue.removeFirst()
                        
                        for i in 0..<5 { // 상하좌우를 돈다.
                            // 큐에서 꺼낸 기준값을 기준으로 상하좌우 변수를 하나씩 정해서 탐색한다.
                            let nx = x + dx[i]
                            let ny = y + dy[i]
                            
                            // matrix안에 index가 위치하고, 방문한 적 없는 위치라면
                            if nx >= 0 && ny >= 0 && nx < n && ny < n && visited[nx][ny] == false {
                                
                                if matrix[nx][ny] == 1 { // 그 위치의 값이 1이라면
                                    queue.append([nx, ny])
                                    visited[nx][ny] = true
                                    count += 1
                                }
                            }
                        } // for
                    } // while
                    
                    group += 1 // 만들어진 블럭의 갯수
                    answer.append(count)
                    count = 0
                }
            }
        }
        
        print(group)
        answer = answer.sorted(by: <)
        answer.forEach {
            print($0)
        }
    }
}


