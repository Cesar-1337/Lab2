function prntString(str) // Задание 1, вариант 2
{
    let substr = ""; 
    let maxSubstr = "";

    let cntOperations = 0; // Искомое минимальное количество операций для печати исходной строки
    for (let i = 0; i < Math.floor(str.length / 2); i++) { // Поиск максимального "дубля" от начала строки (для использования операции №2)
        substr += str[i];
        let nextSubstr = str.substring(substr.length, substr.length + i + 1); // "Дубль", который идёт сразу после текущей подстроки
        if (substr === nextSubstr) {
            maxSubstr = substr;
        }
    }

    cntOperations = maxSubstr.length;
    substr = maxSubstr;
    substr += substr;
    if (maxSubstr.length > 0) {
        cntOperations++;
    }

    for (let i = substr.length; i < str.length; i++, cntOperations++) { //Печать оставшихся символов (операция 2 уже применена или не может быть применена)
        substr += str[i];
    }

    return cntOperations;
}

function numberOfMatches(n) // Задание 2, вариант 2
{
    let res = 0;
    while (n > 1) {
      res += Math.floor(n / 2);
      n = (n % 2) ? Math.floor((n + 1) / 2) : Math.floor(n / 2);
    }
    return res;
}

function cntNonDecreasingSeqs(seq) {
    let cnt = 0;
    let prevElem = Number.MAX_INTEGER;
    let insideNonDecreasingSeq = false;
    for (let elem of seq) {
      if (elem >= prevElem) {
        insideNonDecreasingSeq = true;
      } else if (insideNonDecreasingSeq) {
        cnt++;
        insideNonDecreasingSeq = false;
      }
      prevElem = elem;
    }
  
    if (insideNonDecreasingSeq) cnt++;
  
    return cnt;
  }

  function printSeq(seq) {
    console.log(seq.join(" "));
  }

function main() {
    let str = "dbadbaa";
    console.log("Task 1:\n", str, prntString(str));
    str = "ddddaddddabc";
    console.log(str, prntString(str));

    let n = 7;
    console.log("\nTask 2:");
    console.log(`n = ${n}  res = ${numberOfMatches(n)}`);
    n = 14;
    console.log(`n = ${n} res = ${numberOfMatches(n)}\n`);

    let seq = [5, 1, 2, 3, 2, 5];
    console.log("Task 3:");
    printSeq(seq);
    console.log(cntNonDecreasingSeqs(seq));
    console.log();

    let seq2 = [1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3];
    printSeq(seq2);
    console.log(cntNonDecreasingSeqs(seq2));
}

main();