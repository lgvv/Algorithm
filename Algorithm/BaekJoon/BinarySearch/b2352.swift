//
//  b2352.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
// https://www.acmicpc.net/problem/2352
import Foundation

struct b2352 {
    
    static func run() {
        let _ = Int(readLine()!)!
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        
        var list = [input[0]]
        input.forEach { element in
            if element == list.last { }
            else if element > list.last! {
                list.append(element)
            } else { // 이 경우에는 list순회
                let position = lowerBound(arr: list, n: list.count, key: element)
                list[position] = element
            }
            
//            print(list)
        }
        print(list.count)
        
        
        func lowerBound(arr: [Int], n: Int, key: Int) -> Int {
            var start: Int = 0
            var end: Int = n
            
            var mid: Int = n
            
            while end - start > 0 {
                mid = (start + end) / 2
                
                if arr[mid] < key {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            return end
        }
    }
}
