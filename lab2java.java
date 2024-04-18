public class Main {

    public static int prntString(String str) {
        String substr = "";
        String maxSubstr = "";

        int cntOperations = 0;
        for (int i = 0; i < str.length() / 2; i++) {
            substr += str.charAt(i);
            String next_substr = str.substring(substr.length(), substr.length() + i + 1);
            if (substr.equals(next_substr)) {
                maxSubstr = substr;
            }
        }

        cntOperations = maxSubstr.length();
        substr = maxSubstr + maxSubstr;
        if (maxSubstr.length() > 0)
            cntOperations++;

        for (int i = substr.length(); i < str.length(); i++, cntOperations++) {
            substr += str.charAt(i);
        }

        return cntOperations;
    }

    public static int numberOfMatches(int n) {
        int res = 0;
        while (n > 1) {
            res += n / 2;
            n = (n % 2 == 1) ? (n + 1) / 2 : n / 2;
        }
        return res;
    }

    public static int cntNonDecreasingSeqs(int[] seq) {
        int cnt = 0;
        int prevElem = Integer.MAX_VALUE;
        boolean insideNonDecreasingSeq = false;
        for (int elem : seq) {
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

    public static void printSeq(int[] seq) {
        for (int elem : seq) {
            System.out.print(elem + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        String str = "dbadbaa";
        System.out.println("Task 1:\n" + str + " " + prntString(str));
        str = "ddddaddddabc";
        System.out.println(str + " " + prntString(str) + "\n");

        int n = 7;
        System.out.println("Task 2:\n" + "n = " + n + "  res = " + numberOfMatches(n));
        n = 14;
        System.out.println("n = " + n + " res = " + numberOfMatches(n) + "\n");

        int[] seq1 = {5, 1, 2, 3, 2, 5};
        System.out.println("Task 3:");
        printSeq(seq1);
        System.out.println(cntNonDecreasingSeqs(seq1) + "\n");
        
        int[] seq2 = {1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3};
        printSeq(seq2);
        System.out.println(cntNonDecreasingSeqs(seq2) + "\n");
    }
}


