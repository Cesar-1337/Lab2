using System;
using System.Collections.Generic;

public class Program
{
    public static int prntString(string str) // Задание 1, вариант 2
    {
        string substr = "";
        string maxSubstr = "";

        int cntOperations = 0; // Искомое минимальное количество операций для печати исходной строки
        for (int i = 0; i < str.Length / 2; i++) // Поиск максимального "дубля" от начала строки (для использования операции №2)
        {
            substr += str[i];
            string next_substr = str.Substring(substr.Length, i + 1); // "Дубль", который идёт сразу после текущей подстроки
            if (substr == next_substr)
            {
                maxSubstr = substr;
            }
        }

        cntOperations = maxSubstr.Length;
        substr = maxSubstr;
        substr += substr;
        if (maxSubstr.Length > 0)
            cntOperations++;

        for (int i = substr.Length; i < str.Length; i++, cntOperations++) // Печать оставшихся символов (операция 2 уже применена или не может быть применена)
        {
            substr += str[i];
        }

        return cntOperations;
    }

    public static int numberOfMatches(int n) // Задание 2, вариант 2
    {
        int res = 0;
        while (n > 1)
        {
            res += n / 2;
            n = (n % 2 != 0) ? (n + 1) / 2 : (n / 2);
        }
        return res;
    }

    public static int cntNonDecreasingSeqs(List<int> seq) // Задание 3, вариант 12
    {
        int cnt = 0;
        int prevElem = int.MaxValue;
        bool insideNonDecreasingSeq = false;
        foreach (int elem in seq)
        {
            if (elem >= prevElem)
            {
                insideNonDecreasingSeq = true;
            }
            else if (insideNonDecreasingSeq)
            {
                cnt++;
                insideNonDecreasingSeq = false;
            }
            prevElem = elem;
        }

        if (insideNonDecreasingSeq) cnt++;

        return cnt;
    }

    public static void printSeq(List<int> seq)
    {
        foreach (int elem in seq)
        {
            Console.Write(elem + " ");
        }
        Console.WriteLine();
    }

    public static void Main()
    {
        string str = "dbadbaa";
        Console.WriteLine("Task 1:\n" + str + " " + prntString(str));
        str = "ddddaddddabc";
        Console.WriteLine(str + " " + prntString(str) + "\n");

        int n = 7;
        Console.WriteLine("Task 2:\n" + "n = " + n + "  res = " + numberOfMatches(n));
        n = 14;
        Console.WriteLine("n = " + n + " res = " + numberOfMatches(n) + "\n");

        List<int> seq = new List<int> { 5, 1, 2, 3, 2, 5 };
        Console.WriteLine("Task 3:");
        printSeq(seq);
        Console.WriteLine(cntNonDecreasingSeqs(seq) + "\n");

        List<int> seq2 = new List<int> { 1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3 };
        printSeq(seq2);
        Console.WriteLine(cntNonDecreasingSeqs(seq2));
    }
}