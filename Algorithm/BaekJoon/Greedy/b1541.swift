//
//  b1541.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/1541
import Foundation

struct b1541 {
    static func run() {
        
        // 처음 문자가 숫자임으로 처음 수는 무조건 양수이다.
        let input = readLine()!.split { $0 == "-" }
//        print(input)
        
        // 이 문제의 포인트는 음수(-)를 기준으로 괄호를 쳐야한다.
        var sum = 0
        input.forEach {
            var partial = 0
            $0.split(separator: "+").forEach {
                partial += Int($0)!
            }
            
            sum -= partial
        }
        var corret = 0
        input[0].split(separator:"+").forEach {
            corret += Int($0)!
        }
        
        print(sum + corret * 2)
    }
}
