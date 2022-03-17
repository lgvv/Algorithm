//
//  77884.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

import Foundation

struct p77884 {
    static func run() {
        print(p77884.solution(13, 17)) // 43
    }

    static func solution(_ left:Int, _ right:Int) -> Int {
        var sum = 0
        
        // 약수의 갯수 홀짝 판단은 n^2 여부에 따라 결정된다.
        for target in left...right {
            let number = sqrt(Double(target))
            
            if number - Double(Int(number)) != 0 { // 약수 짝수개
                sum += target
            } else {
                sum -= target
            }
            
        }
        
        return sum
    }
}
