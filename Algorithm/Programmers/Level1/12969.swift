//
//  12969.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

import Foundation

struct p12969 {
    static func run() {
        p12969.solution()
    }

    static func solution() {
        let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
        let (a, b) = (n[0], n[1])
        
        var row: String = ""
        
        for _ in 0..<a {
            row = row + "*"
        }
        
        for _ in 0..<b {
            print(row)
        }
        
//        print(a + b)
    }
}
