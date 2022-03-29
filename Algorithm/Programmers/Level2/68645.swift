//
//  68645.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/29.
//

//https://programmers.co.kr/learn/courses/30/lessons/68645
import Foundation

struct p68645 {
    static func run() {
        print(p68645.solution(4)) // [1,2,9,3,10,8,4,5,6,7]
    }

    static func solution(_ n:Int) -> [Int] {
        var matrix: [[Int]] = [[Int]](repeating: Array(repeating: 0,count: n), count: n)
                                      
        let sum = n * (n+1) / 2 // 등차수열의 합
        var row = -1
        var col = 0
        var i = n
        var j = 0
        var currentNumber = 0
        
        while i > 0 {
            
            j = 0
            while (j < i) {
                row += 1
                currentNumber += 1
                matrix[row][col] = currentNumber
                j += 1
            }
            
            j = 0
            while (j < i-1) {
                col += 1
                currentNumber += 1
                matrix[row][col] = currentNumber
                j += 1
            }
            
            j = 0
            while (j < i-2) {
                col -= 1
                row -= 1
                currentNumber += 1
                matrix[row][col] = currentNumber
                j += 1
            }
            
            i -= 3
        }
        
        return matrix.flatMap { $0.filter{ $0 != 0 } }
    }
    
}
