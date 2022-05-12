//
//  b1300.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
// https://www.acmicpc.net/problem/1300
import Foundation

struct b1300 {
    static func run() {
        let n = Int(readLine()!)!
        let target = Int(readLine()!)!
        
        // 각 row(구구단으로 치자면 단)에서 어떤 수보다 작은 값의 갯수를 찾는다.
        
        // 1 ~ n단(row) 사이에서 정해지니까
        var low = 1
        var high = target
        
        while low < high {
            
            let mid = (low + high) / 2 // mid값 세팅
            var count = 0
            
            for i in 1...n { // 각 row를 반복하면서
                count += min(mid / i, n)
                if count > target { break }
            }
            
            // count가 더 크다는 의미는 mid보다 작은 수가 target의 개수보다 많다는 뜻이므로 mid값을 줄여야 한다.
            if target <= count {
                high = mid
            } else {
                low = mid + 1
            }
        }
        
        print(low)
    }
}
