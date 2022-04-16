//
//  49994.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/16.
//
//https://programmers.co.kr/learn/courses/30/lessons/49994
import Foundation

struct p49994 {
    static func run() {
//        print(p49994.solution("LULLLLLLU")) // 7
//        print(p49994.solution("ULURRDLLU")) // 7
//        print(p49994.solution("UUUUDUDUDUUU")) // 5
        print(p49994.solution("LRLR")) // 1
    }
    
    static func solution(_ dirs:String) -> Int {
        
        var visited: [(Int, Int, Int, Int)] = [(5,5,5,5)] // (x,y) 시작점 -> (x,y) 끝점 루트 자체를 저장하자.
        
        var previousPoint = (5,5)
        var currentPoint = (5,5)
        
        var x = currentPoint.0
        var y = currentPoint.1
        
        for dir in dirs {
            switch dir {
            case "U":
                if y - 1 < 0 { // 판을 넘어가면
                    continue
                } else {
                    y -= 1
                }
                break
            case "L":
                if x - 1 < 0 {
                    continue
                } else {
                    x -= 1
                }
                break
            case "R":
                if x + 1 > 10 {
                    continue
                } else {
                    x += 1
                }
                break
            case "D":
                if y + 1 > 10 {
                    continue
                } else {
                    y += 1
                }
                break
            default: print("Default")
            }
            
            currentPoint = (x,y)
            let check = (previousPoint.0, previousPoint.1, currentPoint.0, currentPoint.1)
            let check2 = (currentPoint.0, currentPoint.1, previousPoint.0, previousPoint.1)
            previousPoint = currentPoint
            
            if !visited.contains(where: {
                return $0 == check || $0 == check2
            }) {
                visited.append(check)
            }
        }
        
        print(visited)
        return visited.count - 1
    }
}

