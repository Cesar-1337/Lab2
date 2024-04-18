#include <iostream>
#include <string>
#include <vector>

int prntString(const std::string str) // Задание 1, вариант 2
{
	std::string substr = ""; 
	std::string maxSubstr = "";

	int cntOperations = 0; // Искомое минимальное количество операций для печати исходной строки
	for (size_t i = 0; i < str.size() / 2; i++) // Поиск максимального "дубля" от начала строки (для использования операции №2)
	{
		substr.push_back(str[i]);
		std::string next_substr = str.substr(substr.size(), i + 1); // "Дубль", который идёт сразу после текущей подстроки
		if (substr == next_substr)
		{
			maxSubstr = substr;
		}
	}

	cntOperations = maxSubstr.size();
	substr = maxSubstr;
	substr.append(substr);
	if (maxSubstr.size() > 0)
		cntOperations++;

	for (size_t i = substr.size(); i < str.size(); i++, cntOperations++) // Печать оставшихся символов (операция 2 уже применена или не может быть применена)
	{
		substr.push_back(str[i]);
	}

	return cntOperations;
}

int numberOfMatches(int n) // Задание 2, вариант 2
{
	int res = 0;
	while (n > 1)
	{
		res += n / 2;
		n = (n % 2) ? (n + 1) / 2 : (n / 2);
	}
	return res;
}

int cntNonDecreasingSeqs(std::vector <int> seq) // Задание 3, вариант 12
{
	int cnt = 0;
	int prevElem = INT_MAX;
	bool insideNonDecreasingSeq = false;
	for (int elem : seq)
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

void printSeq(std::vector <int> seq)
{
	for (int elem : seq)
	{
		std::cout << elem << " ";
	}
	std::cout << std::endl;
}


int main()
{
	std::string str = "dbadbaa";
	std::cout << "Task 1:\n" << str << " " << prntString(str) << std::endl;
	str = "ddddaddddabc";
	std::cout << str << " " << prntString(str) << std::endl << std::endl;

	int n = 7;
	std::cout << "Task 2:\n" << "n = " << n << "  res = " << numberOfMatches(n) << std::endl;
	n = 14;
	std::cout << "n = " << n << " res = " << numberOfMatches(n) << std::endl << std::endl;

	std::vector <int> seq = {5, 1, 2, 3, 2, 5};
	std::cout << "Task 3:" << std::endl;
	printSeq(seq);
	std::cout << cntNonDecreasingSeqs(seq) << std::endl << std::endl;

	std::vector <int> seq2 = { 1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3};
	printSeq(seq2);
	std::cout << cntNonDecreasingSeqs(seq2) << std::endl << std::endl;
 
	return 0;
}