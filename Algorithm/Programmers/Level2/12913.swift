//
//  12913.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
//https://programmers.co.kr/learn/courses/30/lessons/12913
import Foundation

struct p12913 {
    static func run() {
        print(p12913.solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]])) // 16
    }

    static func solution(_ land:[[Int]]) -> Int{
        var land = land
        var maxIndex = -1
//        print(land)
        
        for i in 1..<land.count {
            
            land[i][0] += max(land[i-1][1], max(land[i-1][2], land[i-1][3]))
            land[i][1] += max(land[i-1][0], max(land[i-1][2], land[i-1][3]))
            land[i][2] += max(land[i-1][0], max(land[i-1][1], land[i-1][3]))
            land[i][3] += max(land[i-1][0], max(land[i-1][1], land[i-1][2]))
        }
        
//        print(land)
        
        return land.last!.max() ?? 0
    }
}
