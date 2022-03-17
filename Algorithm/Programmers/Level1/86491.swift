//
//  86491.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/86491
import Foundation

struct p86491 {
    static func run() {
        print(p86491.solution([[60, 50], [30, 70], [60, 30], [80, 40]])) // 4000
    }

    static func solution(_ sizes:[[Int]]) -> Int {
        var long = 0
        var short = 0
        
        sizes.forEach { size in
            let tempLong = max(size[0], size[1])
            let tempShort = min(size[0], size[1])
            
            long = max(long, tempLong)
            short = max(short, tempShort)
        }
        
        return long * short
    }
}
