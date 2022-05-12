//
//  b2805.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
// https://www.acmicpc.net/problem/2805
import Foundation

struct b2805 {
    
    static func run() {
        // 나무의 수 N, 상근이가 가져가려는 나무의 길이 M
        let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
        let m = input[1]
        let trees = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
        
        var min = 0
        var max = trees.max()! // Int자료형
        var mid = 0
        var result = 0
        var temp = 0
        
        while min < max {
            mid = (min + max) / 2
            // tree의 원소가 mid보다 크면 그 차이를 더해서 temp에 넣기
            temp = trees.map { $0 > mid ? $0 - mid : 0 }.reduce(0, +)
            
            if temp < m { // 너무 적게 가져간다면, 더 많이 가져가야 하므로
                max = mid // max를 미드로 바꾼다. 즉, mid값을 작게 만들어서 더 많이 가져가게끔
            } else {
                result = mid
                min = mid + 1
            }
        }
        
        print(result)
    }
}
