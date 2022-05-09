//
//  pr1.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/08.
//

import Foundation

struct pr1{
    static func run() {
        print(pr1.solution( [[80, 35], [70, 38], [100, 41], [75,30], [160,80], [77, 29], [181, 68], [151, 76]] )) // 3
  
        print(pr1.solution( [[140, 90], [177, 75], [95, 45], [71, 31], [150, 30], [80, 35], [72, 33], [166, 81], [151, 75]])) // 4
        print(pr1.solution([[30, 15], [80, 35]])) // 0
    }
    
    
    static func solution(_ atmos:[[Int]]) -> Int {
        var day = 0
        var count = 0
        
        
        for i in 0..<atmos.count {
            let atmo = atmos[i]
            
            if atmo[0] >= 81 || atmo[1] >= 36 { // 마스크 착용
                day += 1
                if atmo[0] >= 151 && atmo[1] >= 76 { // 즉시 폐기
                    day = 3
                }
                
                if day == 3 {
                    count += 1
                    day = 0
                }
            } else {
                if day >= 1 {
                    day += 1
                    
                    if day >= 3 {
                        day = 0
                        count += 1
                    }
                }
            }
        }
        
        if day >= 1 {
            count += 1
        }
    
        return count
    }
}
