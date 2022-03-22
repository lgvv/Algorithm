//
//  b10610.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/10610
import Foundation

struct b10610 {
    static func run() {
        let input = readLine()
        
        var flag = false
        var input_list = [Int]()
        var sum = 0
        input!.forEach{ c in
            let num = Int("\(c)")!
            
            input_list.append(num)
            sum += num
            
            if num == 0 {
                flag = true
            }
        }
        
        if flag && (sum % 3 == 0) {
            input_list = input_list.sorted(by: >)
            
            let answer = input_list.map { "\($0)" }.joined()
            print(answer)
        } else {
            print("-1")
        }
        
    }
}
