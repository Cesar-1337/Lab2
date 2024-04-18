fn prnt_string(str: &str) -> usize // Задание 1, вариант 2
{
	let mut substr = String::new();
	let mut max_substr = String::new();

	let mut cnt_operations = 0; // Искомое минимальное количество операций для печати исходной строки
	for i in 0..str.len() / 2 // Поиск максимального "дубля" от начала строки (для использования операции №2)
	{
		substr.push_str(&str[i..=i]);
		let next_substr = &str[substr.len()..=substr.len() + i];
		if substr == next_substr {
			max_substr = substr.clone();
		}
	}

	cnt_operations = max_substr.len();
	substr = max_substr.clone();
	substr.push_str(&max_substr);
	if max_substr.len() > 0 {
		cnt_operations += 1;
	}
    // Печать оставшихся символов (операция 2 уже применена или не может быть применена)

	for i in substr.len()..str.len() { 
		substr.push_str(&str[i..=i]);
		cnt_operations += 1;
	}

	cnt_operations
}

fn number_of_matches(mut n: i32) -> i32 // Задание 2, вариант 2
{
	let mut res = 0;
	while n > 1 {
		res += n / 2;
		n = if n % 2 == 1 { (n + 1) / 2 } else { n / 2 };
	}
	res
}

fn cnt_non_decreasing_seqs(seq: &Vec<i32>) -> i32 // Задание 3, вариант 12
{
	let mut cnt = 0;
	let mut prev_elem = i32::MAX;
	let mut inside_non_decreasing_seq = false;
	for &elem in seq.iter() {
		if elem >= prev_elem {
			inside_non_decreasing_seq = true;
		} else if inside_non_decreasing_seq {
			cnt += 1;
			inside_non_decreasing_seq = false;
		}
		prev_elem = elem;
	}

	if inside_non_decreasing_seq {
		cnt += 1;
	}

	cnt
}

fn print_seq(seq: &Vec<i32>)
{
	for elem in seq {
		print!("{} ", elem);
	}
	println!();
}

fn main() {
	let str1 = "dbadbaa";
	println!("Task 1:");
	println!("{} {}", str1, prnt_string(str1));
	let str2 = "ddddaddddabc";
	println!("{} {}", str2, prnt_string(str2));
	println!();

	let mut n = 7;
	println!("Task 2:");
	println!("n = {}  res = {}", n, number_of_matches(n));
	n = 14;
	println!("n = {}  res = {}", n, number_of_matches(n));
	println!();

	let seq1 = vec![5, 1, 2, 3, 2, 5];
	
	println!("Task 3:");
	
	print_seq(&seq1);
	
	println!("{}", cnt_non_decreasing_seqs(&seq1));
	
	println!();

	let seq2 = vec![1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3];
	print_seq(&seq2);
	println!("{}", cnt_non_decreasing_seqs(&seq2));
}