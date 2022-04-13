//
//  68936.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/13.
//
// https://programmers.co.kr/learn/courses/30/lessons/68936
import Foundation

struct p68936 {
    static func run() {
        print(p68936.solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]])) // [4,9]
    }
    
    static var zeroCount = 0
    static var oneCount = 0
    
    static func solution(_ arr:[[Int]]) -> [Int] {
        // 재귀 쓰면 금방 풀겠다! -> divide and conquer 해야한다.
        
        reculsive(arr: arr, row: 0, col: 0, n: arr.count)
        return [zeroCount, oneCount]
    }
    
    static func reculsive(arr: [[Int]], row: Int, col: Int, n: Int) {
        let point = arr[row][col] // 시작하는 지점
        
        for i in row..<row + n {
            for j in col..<col + n {
                if point != arr[i][j] {
                    reculsive(arr: arr, row: row, col: col, n: n/2)
                    reculsive(arr: arr, row: row, col: col + n/2, n: n/2)
                    reculsive(arr: arr, row: row + n/2, col: col, n: n/2)
                    reculsive(arr: arr, row: row + n/2, col: col + n/2, n: n/2)
                    
                    return
                }
            }
        }
        
        // 하나의 영역으로 묶였을 경우 or 끝까지 묶이지 않아 n이 1인 경우
        if point == 1 { oneCount += 1 }
        else { zeroCount += 1}
    }
}
