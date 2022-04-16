//
//  17686.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/16.
//
//https://programmers.co.kr/learn/courses/30/lessons/17686
import Foundation

struct p17686 {
    static func run() {
//        print(p17686.solution( ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])) // ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
//        print(p17686.solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])) // ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]
//        print(p17686.solution(["O00321", "O49qcGPHuRLR5FEfoO00321"])) // ["O49qcGPHuRLR5FEfoO00321", "O00321"]
        
//        print(p17686.solution(["muzi1.png1", "MUZI1.png2", "MUZI1.png3", "muzi1.png4"]))
//        print(p17686.solution(["muzi1.txt", "MUZI1.txt", "muzi001.txt", "muzi1.TXT"]))
//        print(p17686.solution([" mm 1.txt", " mm1.txt", "muzi001.txt", "muzi1.TXT"]))
        
        print(p17686.solution( ["img12.png", "img10.png", "img02.png", "img01.PNG",  "img1.png", "IMG01.GIF", "img2.JPG"]))
    }
    
    static func solution(_ files:[String]) -> [String] {
        
        // head, number는 무조건 1글자 이상이나 tail은 없을 수도 있다.
        var fileList = [(String, String, String)]()
        
        // 데이터 정제
        files.forEach { file in
            
            var numberFlag = false
            var numberRangeStart = -1
            
            var numberCount = 0 // 숫자는 최대 5개이므로
            for i in 0..<file.count {
                let idx = file.index(file.startIndex, offsetBy: i)
                
                if file[idx].isNumber && numberCount != 0 && file[idx] == "0" {
                    print(numberCount)
                    numberCount += 1
                }
                
                if file[idx].isNumber && numberFlag == false {
                    numberFlag = true
                    numberRangeStart = i
                    numberCount = 1
                } else if (!file[idx].isNumber && numberFlag == true) || numberCount >= 5 {
                    // 이때 number의 range가 정해진다.
                    let headIndex = file.index(file.startIndex, offsetBy: numberRangeStart)
                    let head = String(file[..<headIndex])
                    let number = String(file[headIndex..<idx])
                    let tail = String(file[idx...])
                    
                    let data = (head, number, tail)
                    fileList.append(data)
                    numberFlag = false
                    
                    break
                }
            }
            
            if numberFlag == true { // 여전히 true인 경우는 파일의 tail이 숫자인경우
                let headIndex = file.index(file.startIndex, offsetBy: numberRangeStart)
                let head = String(file[..<headIndex])
                let number = String(file[headIndex...])
                
                let data = (head, number, "")
                fileList.append(data)
            }
        }
        
        // 데이터 정렬
        // head -> number -> tail의 우선순위
        let sortedList = fileList.sorted {

            if $0.0.lowercased() == $1.0.lowercased() {
                return Int($0.1)! < Int($1.1)!
            }
            return $0.0.lowercased() < $1.0.lowercased() // 여기가 말썽이었다 ㅠ
        }

        // 출력부
        var answer = [String]()
        sortedList.forEach { file in
            answer.append("\(file.0)\(file.1)\(file.2)")
        }
        
        return answer
    }
}

