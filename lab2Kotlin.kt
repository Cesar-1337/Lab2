fun prntString(str: String): Int {
    var substr = ""
    var maxSubstr = ""

    var cntOperations = 0
    for (i in 0 until str.length / 2) {
        substr += str[i]
        val nextSubstr = str.substring(substr.length, substr.length + i + 1)
        if (substr == nextSubstr) {
            maxSubstr = substr
        }
    }

    cntOperations = maxSubstr.length
    substr = maxSubstr + maxSubstr
    if (maxSubstr.isNotEmpty()) {
        cntOperations++
    }

    for (i in substr.length until str.length) {
        substr += str[i]
        cntOperations++
    }

    return cntOperations
}

fun numberOfMatches(n: Int): Int {
    var nVar = n
    var res = 0
    while (nVar > 1) {
        res += nVar / 2
        nVar = if (nVar % 2 == 1) (nVar + 1) / 2 else nVar / 2
    }
    return res
}

fun cntNonDecreasingSeqs(seq: List<Int>): Int {
    var cnt = 0
    var prevElem = Int.MAX_VALUE
    var insideNonDecreasingSeq = false
    for (elem in seq) {
        if (elem >= prevElem) {
            insideNonDecreasingSeq = true
        } else if (insideNonDecreasingSeq) {
            cnt++
            insideNonDecreasingSeq = false
        }
        prevElem = elem
    }

    if (insideNonDecreasingSeq) cnt++

    return cnt
}

fun printSeq(seq: List<Int>) {
    for (elem in seq) {
        print("$elem ")
    }
    println()
}

fun main() {
    var str = "dbadbaa"
    println("Task 1:\n$str ${prntString(str)}")
    str = "ddddaddddabc"
    println("$str ${prntString(str)}\n")

    var n = 7
    println("Task 2:\nn = $n  res = ${numberOfMatches(n)}")
    n = 14
    println("n = $n res = ${numberOfMatches(n)}\n")

    val seq = listOf(5, 1, 2, 3, 2, 5)
    println("Task 3:")
    printSeq(seq)
    println(cntNonDecreasingSeqs(seq).toString() + "\n")

    val seq2 = listOf(1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3)
    printSeq(seq2)
    println(cntNonDecreasingSeqs(seq2).toString() + "\n")
}