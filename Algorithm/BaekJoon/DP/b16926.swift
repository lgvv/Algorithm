//
//  b16926.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/29.
//
//https://www.acmicpc.net/problem/1463
import Foundation

struct b1463 {
    static func run() {
        // DP를 이용하여 풀어야 합니다.
        let input: Int! = Int(readLine()!) // 1..<1000 정수
        var arr: [Int] = [Int](repeating: 0, count: input+1)
//        print(arr)
        for i in 2..<input+1 {
            arr[i] = arr[i-1] + 1

            if i % 3 == 0 {
                arr[i] = min(arr[i], arr[i/3] + 1)
            }

            if i % 2 == 0 {
                arr[i] = min(arr[i], arr[i/2] + 1)
            }
        }

        print(arr[input])
    }
}
