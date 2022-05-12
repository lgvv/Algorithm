//
//  b12738.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
// https://www.acmicpc.net/problem/12738
import Foundation

struct b12738 {
    // 7
    // 1 2 -2 -1 1 2 1
    static func run() {
        let _ = Double(readLine()!)!
        let input = readLine()!.components(separatedBy: " ").map{ Double($0)! }
        
        // 최장 수열을 담을 배열이 필요하다.
        var list = [input[0]]
        
        /* (로직)
            값이 있는 부분의 뒤에서부터 탐색한다.
            탐색하려는 인덱스의 값보다 새로운 값이 더 큰 경우에는 탐색하려는 인덱스 뒤에 값을 넣어줍니다.
            탐색 인덱스가 맨 처음 인덱스까지 가도 자신보다 작은 인덱스를 못찾는 경우 맨 처음에 넣어준다.
            항생 배열에 들아간 숫자의 갯수가 최장 수열의 길이이다.
         */
        input.forEach { element in
            if element == list.last { }
            else if element > list.last! {
                list.append(element)
            } else { // 이 경우에는 list순회
                let position = lowerBound(arr: list, n: list.count, key: element)
                list[position] = element
            }
            
            print(list)
        }
        print(list.count)
        
        
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
    }
}
