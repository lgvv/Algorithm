//
//  b2178.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/02.
//
//https://www.acmicpc.net/problem/2178
import Foundation

struct b2178 {
    static func run() {
        // Input 처리
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        var board = [[Int]](repeating: [], count: input[0])
        
        for i in 0..<input[0] {
            let v = readLine()!.map { Int("\($0)")! }
            board[i].append(contentsOf: v)
        }
//        print(board)
        
        // 상화좌우 세팅
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        var queue = [[0,0]] // 큐
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: input[1]), count: input[0]) // 방문했는지 확인
        
        var nx = 0
        var ny = 0
        
        // 시작좌표 세팅
        var x = queue[0][0]
        var y = queue[0][1]
        visited[0][0] = true
        
        while !queue.isEmpty {
            x = queue[0][0]
            y = queue[0][1]
            
            queue.removeFirst() // append로 넣을 것이라서 FIFO 적용
            
            for i in 0..<4 {
                // 이동 가능한 좌표 계산
                nx = x + dx[i]
                ny = y + dy[i]
                
                // 좌표가 board의 좌표를 벗어나지 않으면
                if nx >= 0 && ny >= 0 && nx < input[0] && ny < input[1] && visited[nx][ny] == false {
                    if board[nx][ny] == 1 {
                        queue.append([nx, ny])
                        board[nx][ny] = board[x][y] + 1 // 총 이동거리 계산
                        visited[nx][ny] = true // 방문한 곳은 true로 변경
//                        print("-> \(queue) \n -> \(board)")
                    }
                }
            }
        }
        print(board[input[0]-1][input[1]-1])
    }
}
