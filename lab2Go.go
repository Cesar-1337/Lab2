package main

import (
	"fmt"
	"math"
)

func prntString(str string) int { // Задание 1, вариант 2
	substr := ""
	maxSubstr := ""

	cntOperations := 0 // Искомое минимальное количество операций для печати исходной строки
	for i := 0; i < len(str)/2; i++ { // Поиск максимального "дубля" от начала строки (для использования операции №2)
		substr += string(str[i])
		nextSubstr := str[len(substr) : len(substr) + i + 1] // "Дубль", который идёт сразу после текущей подстроки
		if substr == nextSubstr {
			maxSubstr = substr
		}
	}

	cntOperations = len(maxSubstr)
	substr = maxSubstr
	substr += substr
	if len(maxSubstr) > 0 {
		cntOperations++
	}

	for i := len(substr); i < len(str); i, cntOperations = i + 1, cntOperations + 1 { // Печать оставшихся символов (операция 2 уже применена или не может быть применена)
		substr += string(str[i])
	}

	return cntOperations
}

func numberOfMatches(n int) int { // Задание 2, вариант 2
	res := 0
	for n > 1 {
		res += n / 2
		if n%2 == 1 {
			n = (n + 1) / 2
		} else {
			n /= 2
		}
	}
	return res
}

func cntNonDecreasingSeqs(seq []int) int { // Задание 3, вариант 12
	cnt := 0
	prevElem := math.MaxInt
	insideNonDecreasingSeq := false
	for _, elem := range seq {
		if elem >= prevElem {
			insideNonDecreasingSeq = true
		} else if insideNonDecreasingSeq {
			cnt++
			insideNonDecreasingSeq = false
		}
		prevElem = elem
	}

	if insideNonDecreasingSeq {
		cnt++
	}

	return cnt
}

func printVector(vec []int) {
	for _, elem := range vec {
		fmt.Print(elem, " ")
	}
	fmt.Println()
}

func main() {
	str := "dbadbaa"
	fmt.Println("Task 1:")
	fmt.Println(str, prntString(str))
	str = "ddddaddddabc"
	fmt.Println(str, prntString(str))
	fmt.Println()

	n := 7
	fmt.Println("Task 2:")
	fmt.Println("n =", n, "res =", numberOfMatches(n))
	n = 14
	fmt.Println("n =", n, "res =", numberOfMatches(n))
	fmt.Println()

	seq := []int{5, 1, 2, 3, 2, 5}
	fmt.Println("Task 3:")
	printVector(seq)
	fmt.Println(cntNonDecreasingSeqs(seq))
	fmt.Println()

	seq2 := []int{1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3}
	printVector(seq2)
	fmt.Println(cntNonDecreasingSeqs(seq2))
	fmt.Println()
}
