//
//  92341.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/13.
//
//https://programmers.co.kr/learn/courses/30/lessons/92341
import Foundation


struct p92341 {
    static func run() {
//        print(p92341.solution(
//            [180, 5000, 10, 600],
//            ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"] )) // [14600, 34400, 5000]
//
//        print(p92341.solution(
//            [120, 0, 60, 591],
//            ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"] )) // [0, 591]
        
        print(p92341.solution(
            [1, 461, 1, 10],
            ["00:00 1234 IN"] )) // [14841]
    }

    static func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        
        
        var dict: [String: String] = [:] // 차량번호 : 시간
        var totalTimeArray: [String: Int] = [:] // 차량번호 : 누적시간
        var priceDict: [String: Int] = [:] // 차량번호 : 금액
        
        // records 내에서의 인덱스와 차랑번호를 저장
        records.forEach { record in
            let info = record.components(separatedBy: " ")
            let carNumber = info[1]
            
            if dict[carNumber] == nil { // 아직 IN하지 않았다면
                dict[carNumber] = info[0]
                
                if totalTimeArray[carNumber] == nil {
                    totalTimeArray[carNumber] = 0
                }
            } else { // 이미 차가 들어왔다면
                // 계산하는 로직 수행해야 합니다.
                let inTime = dict[carNumber]! // 이전에 들어왔던 시간
                let time = calueteTime(fees: fees, inTime: inTime, outTime: info[0]) // 이번 구간에서 주차한 시간 계산
                
                dict[carNumber] = nil // 출차 처리
                
                if totalTimeArray[carNumber] == nil {
                    totalTimeArray[carNumber] = time
                } else {
                    totalTimeArray[carNumber]! += time
                }
            }
        }
        
        dict.forEach { carNumber, value in
            let inTime = dict[carNumber]!
            let time = calueteTime(fees: fees, inTime: inTime, outTime: "23:59")
            
            totalTimeArray[carNumber]! += time
            dict[carNumber] = nil // 굳이 이 코드는 없어도 된다.
        }
        
//        print("totalTimeArray \(totalTimeArray)")
        
        totalTimeArray.forEach { carNumber, time in
            let time = time - fees[0] // 기본시간 빼주기
            var price = fees[1] // 기본금액
            
            if time <= 0 {
                // 기본 금액만 내면 된다.
            } else {
                var count = time / fees[2]
                if time % fees[2] != 0 {
                    count += 1
                }
                
                price += count * fees[3]
            }
            
            priceDict[carNumber] = price
        }
        var answer = priceDict.sorted { $0.key < $1.key }.map { $0.value }
        
//        print(answer)
        
        return answer
    }
    
    static func calueteTime(fees: [Int], inTime: String, outTime: String) -> Int{
        let inTimeArray = inTime.components(separatedBy: ":").map { Int($0)! }
        let outTimeArray = outTime.components(separatedBy: ":").map { Int($0)! }
        
        let hour = outTimeArray[0] - inTimeArray[0]
        let minute = outTimeArray[1] - inTimeArray[1]
        
        return hour * 60 + minute
    }
}

