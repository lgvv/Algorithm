//
//  b7576.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/03.
//
//https://www.acmicpc.net/problem/7576
import Foundation

struct b7576 {
    static func run() {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        let m = nums[0], n = nums[1]
        
        var matrix = [[Int]]()
        var queue = [(Int, Int)]()
        
        for i in 0..<n {
            let values = readLine()!.split(separator: " ").map { Int($0)! }
            queue.append(contentsOf: values.enumerated().filter({ 1 == $0.element }).map { (i,$0.offset) }) // 값이 1인 indexes
            matrix.append(values)
        }
        //print(matrix)
        
        // 자기자리 + 상하좌우
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        // 여러개의 포인트가 미로찾기를 해야한다.
        
        var maxValue = 0
        var queueIndex = 0 // 시간복잡도 개선을 위해서 사용
        
        while queue.count > queueIndex {
            let x = queue[queueIndex].0
            let y = queue[queueIndex].1
            
            queueIndex += 1
            
            for i in 0..<4 {
                // 이동 가능한 좌표 계산
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                // 좌표가 board의 좌표를 벗어나지 않으면
                if nx >= 0 && ny >= 0 && nx < n && ny < m {
                    if matrix[nx][ny] == 0 {
                        queue.append((nx, ny))
                        matrix[nx][ny] = matrix[x][y] + 1 // 총 이동거리 계산
                    }
                }
            }
        }
        
        let flatvisited = matrix.flatMap { $0 }
        maxValue = flatvisited.max() ?? 1
        
        if flatvisited.contains(0) {
            print("-1")
        } else if maxValue == 1 {
            print("0")
        } else {
            print(maxValue - 1)
        }
    }
}
