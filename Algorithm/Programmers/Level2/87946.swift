//
//  87946.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/28.
//

//https://programmers.co.kr/learn/courses/30/lessons/87946
import Foundation

struct p87946 {
    
    static func run() {
        print(p87946.solution(80, [[80,20],[50,40],[30,10]])) // 3
    }
    
    static var count = 0
    static var results: Set<[[Int]]> = []
    
    static func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        // 정렬이 먼저겠다. 정렬 1순위 : 사용 피로도, 정렬 2순위 : 최소 피로도
        // 던점 최대 8개면 그냥 배열 갖고 완전탐색 해도 괜찮을 듯
        
        reculsive(list: [], remain: dungeons, len: dungeons.count)
        
//        print("result -> \(results)")
        for result in results {
            var k = k
            var tempCount = 0
            
            for item in result {
//                print("\(item[0]) || \(k)")
                if item[0] <= k {
                    k -= item[1]
                    tempCount += 1
//                    print("ad \(tempCount)")
                }
            }
            count = max(count, tempCount)
            
            if count == dungeons.count { break }
        }
        
        return count
    }
    
    static func reculsive(list: [[Int]], remain: [[Int]], len: Int) {
        if list.count == len {
//            print("🎃 \(list)")
            results.insert(list)
            return
        }
        
        for i in 0..<remain.count {
            var list = list
            list.append(remain[i])
            var arr = remain
            arr.remove(at: i)
            reculsive(list: list, remain: arr, len: len)
        }
        
    }
}
