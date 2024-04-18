# Задание 1, вариант 2
def prnt_string(str)
    substr = ""
    max_substr = ""
  
    cnt_operations = 0 # Искомое минимальное количество операций для печати исходной строки
    (0...(str.size / 2)).each do |i| # Поиск максимального "дубля" от начала строки (для использования операции №2)
      substr += str[i]
      next_substr = str[substr.size, i + 1] # "Дубль", который идёт сразу после текущей подстроки
      if substr == next_substr
        max_substr = substr
      end
    end
  
    cnt_operations = max_substr.size
    substr = max_substr
    substr += substr
    cnt_operations += 1 if max_substr.size > 0
  
    (substr.size...str.size).each do |i| # Печать оставшихся символов (операция 2 уже применена или не может быть применена)
      substr += str[i]
      cnt_operations += 1
    end
  
    cnt_operations
  end
  
  # Задание 2, вариант 2
  def number_of_matches(n)
    res = 0
    while n > 1
      res += n / 2
      n = (n.odd? ? (n + 1) / 2 : n / 2)
    end
    res
  end
  
  # Задание 3, вариант 12
  def cnt_non_decreasing_seqs(seq)
    cnt = 0
    prev_elem = Float::INFINITY
    inside_non_decreasing_seq = false
    seq.each do |elem|
      if elem >= prev_elem
        inside_non_decreasing_seq = true
      elsif inside_non_decreasing_seq
        cnt += 1
        inside_non_decreasing_seq = false
      end
      prev_elem = elem
    end
  
    if inside_non_decreasing_seq
        cnt += 1
    end
  end
  
  def print_seq(seq)
    puts seq.join(' ')
  end
  
  # Main
  str = "dbadbaa"
  puts "Task 1:"
  puts "#{str} #{prnt_string(str)}"
  str = "ddddaddddabc"
  puts "#{str} #{prnt_string(str)}"
  puts
  
  n = 7
  puts "Task 2:"
  puts "n = #{n}  res = #{number_of_matches(n)}"
  n = 14
  puts "n = #{n} res = #{number_of_matches(n)}"
  puts
  
  seq = [5, 1, 2, 3, 2, 5]
  puts "Task 3:"
  print_seq(seq)
  puts cnt_non_decreasing_seqs(seq)
  puts
  
  seq2 = [1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3]
  print_seq(seq2)
  puts cnt_non_decreasing_seqs(seq2)
  puts