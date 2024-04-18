import Foundation

 // Задание 1, вариант 2
func prntString(_ str: String) -> Int {
    var substr = ""
    var maxSubstr = ""
    
    var cntOperations = 0 // Искомое минимальное количество операций для печати исходной строки
    // Поиск максимального "дубля" от начала строки (для использования операции №2)
    for i in 0..<str.count/2 {
        substr.append(str[str.index(str.startIndex, offsetBy: i)])
        // "Дубль", который идёт сразу после текущей подстроки
        let nextSubstr = String(str[str.index(str.startIndex, offsetBy: substr.count)..<str.index(str.startIndex, offsetBy: substr.count + i+1)]) 
        if substr == nextSubstr {
            maxSubstr = substr
        }
    }
    
    cntOperations = maxSubstr.count // Печать оставшихся символов (операция 2 уже применена или не может быть применена)
    substr = maxSubstr
    substr += substr
    if !maxSubstr.isEmpty {
        cntOperations += 1
    }
    
    for i in substr.count..<str.count {
        substr.append(str[str.index(str.startIndex, offsetBy: i)])
        cntOperations += 1
    }
    
    return cntOperations
}

// Задание 2, вариант 2
func numberOfMatches(_ n: Int) -> Int {
    var res = 0
    var num = n
    while num > 1 {
        res += num / 2
        num = (num % 2 == 1) ? (num + 1) / 2 : num / 2
    }
    return res
}

// Задание 3, вариант 12
func cntNonDecreasingSeqs(_ seq: [Int]) -> Int {
    var cnt = 0
    var prevElem = Int.max
    var insideNonDecreasingSeq = false
    for elem in seq {
        if elem >= prevElem {
            insideNonDecreasingSeq = true
        } else if insideNonDecreasingSeq {
            cnt += 1
            insideNonDecreasingSeq = false
        }
        prevElem = elem
    }
    
    if insideNonDecreasingSeq {
        cnt += 1
    }
    
    return cnt
}

func printSeq(_ seq: [Int]) {
    print(seq.map { String($0) }.joined(separator: " "))
}

// Main
let str1 = "dbadbaa"
print("Task 1:")
print("\(str1) \(prntString(str1))")
let str2 = "ddddaddddabc"
print("\(str2) \(prntString(str2))\n")

var n = 7
print("Task 2:")
print("n = \(n)  res = \(numberOfMatches(n))")
n = 14
print("n = \(n) res = \(numberOfMatches(n))\n")

let seq1 = [5, 1, 2, 3, 2, 5]
print("Task 3:")
printSeq(seq1)
print(cntNonDecreasingSeqs(seq1))
print()

let seq2 = [1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3]
printSeq(seq2)
print(cntNonDecreasingSeqs(seq2))
print()
