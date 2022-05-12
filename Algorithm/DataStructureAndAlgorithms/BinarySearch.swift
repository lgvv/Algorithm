//
//  LowerBound.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//

import Foundation

/// 오름차순으로 정렬 된 리스트에서 item의 index를 반환합니다. 없으면 -1
func binarySearchForAscending<T: Comparable>(array: [T], item: T) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

/// 내림차순으로 정렬 된 리스트에서 item의 index를 반환합니다. 없으면 -1
func binarySearchForDescending<T: Comparable>(array: [T], item: T) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        if guess == item {
            return mid
        } else if guess < item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

//https://icksw.tistory.com/27
// 속도아 아래 알고리즘이 제일 빨랐습니다. 백준 1920번 기준
/// 이진 탐색 입니다. 아이템이 들어 있으면 1 없으면 0을 반환합니다.
func binarySearch(_ firstArray: [Int], _ temp: Int) -> Int {
    if temp < firstArray[0] {
        return 0
    } else if temp > firstArray[firstArray.count - 1] {
        return 0
        
    } else {
        var start: Int = 0
        var end: Int = firstArray.count - 1
        var mid: Int = (end + start) / 2
        while (end-start >= 0) {
            if firstArray[mid] == temp {
                return 1
                
            } else if (firstArray[mid] < temp) {
                start = mid + 1
                
            } else if (firstArray[mid] > temp){
                end = mid - 1
                
            }
            mid = (start + end) / 2
            
        }
        
    }
    return 0
}
