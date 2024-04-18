def prnt_string(s):
    substr = ""
    max_substr = ""
    cnt_operations = 0
    for i in range(len(s) // 2):
        substr += s[i]
        next_substr = s[len(substr):len(substr) + i + 1]
        if substr == next_substr:
            max_substr = substr

    cnt_operations = len(max_substr)
    substr = max_substr + max_substr
    if len(max_substr) > 0:
        cnt_operations += 1

    for i in range(len(substr), len(s)):
        substr += s[i]
        cnt_operations += 1

    return cnt_operations

def number_of_matches(n):
    res = 0
    while n > 1:
        res += n // 2
        n = (n + 1) // 2 if n % 2 else n // 2
    return res

def cnt_non_decreasing_seqs(seq):
    cnt = 0
    prev_elem = float('inf')
    inside_non_decreasing_seq = False
    for elem in seq:
        if elem >= prev_elem:
            inside_non_decreasing_seq = True
        elif inside_non_decreasing_seq:
            cnt += 1
            inside_non_decreasing_seq = False
        prev_elem = elem

    if inside_non_decreasing_seq:
        cnt += 1

    return cnt

def print_seq(seq):
    print(" ".join(map(str, seq)))

if __name__ == "__main__":
    str1 = "dbadbaa"
    print("Task 1:")
    print(str1, prnt_string(str1))
    str1 = "ddddaddddabc"
    print(str1, prnt_string(str1), "\n")

    n = 7
    print("Task 2:")
    print(f"n = {n}  res = {number_of_matches(n)}")
    n = 14
    print(f"n = {n} res = {number_of_matches(n)}\n")

    seq = [5, 1, 2, 3, 2, 5]
    print("Task 3:")
    print_seq(seq)
    print(cnt_non_decreasing_seqs(seq), "\n")

    seq2 = [1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3]
    print_seq(seq2)
    print(cnt_non_decreasing_seqs(seq2), "\n")


