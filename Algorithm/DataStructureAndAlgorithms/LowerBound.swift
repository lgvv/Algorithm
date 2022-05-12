//
//  LowerBound.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//

import Foundation

/// binarySearch에서 위치를 반환합니다.
func lowerBound(arr: [Double], n: Int, key: Double) -> Int {
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
