//
//  b2839.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/2839
import Foundation
struct b2839 {
    static func run() {
        var count = 0
        
        var input: Int! = Int(readLine()!)! // 3..<5000 정수
        
        while input > 0 {
            
            // 둘다 0으로 나누어 떨어지는지 체크 (큰수가 유리함으로 큰수부터 차례로)
            if input % 5 == 0 {
                count += 1
                input -= 5
            } else if input % 3 == 0 {
                count += 1
                input -= 3
            } else if input > 5 { // 둘다 나누어 떨어지지 않는데, input이 5보다 크면
                count += 1
                input -= 5
            } else {
                count = -1
                break
            }
        }
        print(count)
        
    }
}
