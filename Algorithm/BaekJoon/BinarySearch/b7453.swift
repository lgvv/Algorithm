//
//  b7453.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
// https://www.acmicpc.net/problem/7453
import Foundation

struct b7453 {
    
    static func run() {
        let n = Int(readLine()!)!
        
        var a = [Int64]()
        var b = [Int64]()
        var c = [Int64]()
        var d = [Int64]()
        
        for _ in 0..<n {
            let temp = readLine()!.split(separator: " ").map { Int64(String($0))! }
            a.append(temp[0])
            b.append(temp[1])
            c.append(temp[2])
            d.append(temp[3])
        }
        
        var sumAB = [Int64]()
        var sumCD = [Int64]()
        
        for i in 0..<n {
            for j in 0..<n {
                sumAB.append(a[i] + b[j])
                sumCD.append(c[i] + d[j])
            }
        }
        
        sumAB.sort()
        sumCD.sort()
        
        var result: Int64 = 0
        var left = 0
        var right = sumAB.count - 1
        
        while left < sumAB.count && right >= 0 {
            let sum = sumAB[left] + sumCD[right]
            
            if sum == 0 { // 같을 경우
                // 중복이 몇개 있는지 체크합니다.
//                print("sumAB[left] \(sumAB[left]) sumCD[right] \(sumCD[right])")
                var xCount: Int64 = 0
                var yCount: Int64 = 0
                let x = sumAB[left], y = sumCD[right]
                
                while sumCD[right] == y {
                    yCount += 1
                    right -= 1
                    if right == -1 { break } // right가 인덱스의 범위를 벗어남
                }
                
                while sumAB[left] == x {
                    xCount += 1
                    left += 1
                    if left == sumAB.count { break } // left가 인덱스의 범위를 벗어남
                }
                
                result += xCount * yCount
                
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
        
        print(result)
    }
}
