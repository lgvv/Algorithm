//
//  1789.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/1789
import Foundation

struct b1789 {
    static func run() {
        
        let input: Double! = Double(readLine()!)
        var start = Int(sqrt(input))

        while true {
            var answer = start * (start + 1) / 2

            if answer > Int(input!) {
                print(start - 1)
                break
            }
            start += 1
        }
    }
}
