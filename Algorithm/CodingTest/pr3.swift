//
//  pr3.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/08.
//

import Foundation

struct pr3 {
    static func run() {
        print(pr3.solution("Q4OYPI")) // [0,0,1,0,1,1]
    }
    
    // fail
    static func solution(_ line:String) -> [Int] {
        // 2x2 행렬을 만들자.
        var answer = [Int]()
        
        var left = findPosition("Q")
        var right = findPosition("P")
//        print(findPosition("4"))
//        print(left)
//        print(right)
        line.forEach {
            let position = findPosition("\($0)")
            
            let xLeft = abs(position.0 - left.1)
            let yLeft = abs(position.0 - left.0)
            let leftDistance = xLeft + yLeft
            
            let xRight = abs(position.0 - right.0)
            let yRight = abs(position.1 - right.1)
            let RightDistance = xRight + yRight
            
//            print("position \(position) L: \(left) R: \(right)")
//            print("\(leftDistance) \(RightDistance)")
            
            
            if leftDistance == RightDistance {
                // 수평거리 계산
//                print("수평거리 계산")
                if xLeft == xRight {
                    // 키보드상 위치 계산
                    if position.0 <= 4 {
                        left = position
                        answer.append(0)
                    } else {
                        right = position
                        answer.append(1)
                    }
                } else {
                    if xLeft > xRight { // right가 더 가깝다
                        right = position
                        answer.append(1)
                    } else {
                        left = position
                        answer.append(0)
                    }
                }
            } else {
                if leftDistance > RightDistance { // right가 더 가깝다.
                    right = position
                    answer.append(1)
                } else {
                    left = position
                    answer.append(0)

                }
            }
            
//            print("target \($0) left \(left) right \(right) \(answer)")
        }
        
        return answer
    }
    
    static func findPosition(_ target: String) -> (Int, Int) {
        let table = [
            ["1","2","3","4","5","6","7","8","9","0"],
            ["Q","W","E","R","T","Y","U","I","O","P"]
        ]
        
        let item = table.flatMap { $0 }.firstIndex(of: target).map { Int($0) }!
        var xPosition = 0
        var yPosition = 0
        if item < 10 {
            xPosition = item
            yPosition = 0
        } else {
            xPosition = 1
            yPosition = item - 10
        }
//        print(xPosition)
//        print(yPosition)
        return (xPosition, yPosition)
    }
    
}
