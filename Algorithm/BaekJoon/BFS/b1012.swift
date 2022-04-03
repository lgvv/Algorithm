//
//  b1012.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/03.
//
//https://www.acmicpc.net/problem/1012
import Foundation

struct b1012 {
    static func run() {
        // Input 처리
        let n = Int(readLine()!)!
        var answer = [Int]()
        
        for _ in 0..<n { // 여러개의 테스트 케이스를 수행해야 하므로 for문으로 반복 횟수를 정한다.
            let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
            
            var matrix = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: input[1]), count: input[0])
            
            for _ in 0..<input[2] {
                let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
                matrix[line[0]][line[1]] = 1
            }
            
            // 상하좌우
            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]
            
            var queue = [[Int]]()
            var count = 0 // 한 테스트 케이스의 결과값을 저장하는 변수
            
            for i in 0..<input[0] { // 행우선 반복
                for j in 0..<input[1] { // 열우선 반복
                    
                    if matrix[i][j] == 1 && visited[i][j] == false { // 그 행의 값이 1이고, 방문한 적이 없다면
                        // BFS 알고리즘을 채택함
                        queue.append([i,j]) // queue에 넣는다
                        
                        while !queue.isEmpty { // 큐가 비어있지 않다면 지속적으로 수행.
                            // 큐의 제일 앞의 값을 빼낸다.
                            let x = queue[0][0]
                            let y = queue[0][1]
                            
                            queue.removeFirst()
                            
                            for i in 0..<4 { // 상하좌우를 돈다.
                                // 큐에서 꺼낸 기준값을 기준으로 상하좌우 변수를 하나씩 정해서 탐색한다.
                                let nx = x + dx[i]
                                let ny = y + dy[i]
                                
                                // matrix안에 index가 위치하고, 방문한 적 없는 위치라면
                                if nx >= 0 && ny >= 0 && nx < input[0] && ny < input[1] && visited[nx][ny] == false {
                                    
                                    if matrix[nx][ny] == 1 { // 그 위치의 값이 1이라면
                                        queue.append([nx, ny]) // 큐에 넣고
                                        visited[nx][ny] = true // 값이 1인 여기는 방문했다고 처리
                                        /* (주의)
                                         모든 곳을 visited처리하지 않고 1로 정해진 위치를 방문했는지만 확인하면 되므로
                                         1인 위치가 방문했는지 안했는지만 체크함.
                                         */
                                    }
                                }
                            } // for
                        } // while
                        
                        count += 1 // while문을 탈출했다는 건, 연속적으로 이어지지 않아 하나의 블럭이 만들어졌다는 의미이므로 이때 카운팅
                    }
                }
            }
            answer.append(count)
        }
        answer.forEach {
            print($0)
        }
    }
}
