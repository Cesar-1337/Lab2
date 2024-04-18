import Data.List (group)

cntNonDecreasingSeqs :: [Int] -> Int
cntNonDecreasingSeqs [] = 0
cntNonDecreasingSeqs seq = length . filter isNonDecreasing . group $ zipWith (<=) seq (tail seq)
  where
    isNonDecreasing = all (== True)

printSeq :: [Int] -> IO ()
printSeq seq = putStrLn $ unwords (map show seq)

main :: IO ()
main = do
    let seq1 = [5, 1, 2, 3, 2, 5]
    let seq2 = [1, 2, 3, 1, 2, 4, 5, 2, 2, 2, -1, 3]
    putStrLn "Task 3:"
    printSeq seq1
    putStrLn (show (cntNonDecreasingSeqs seq1))
    printSeq seq2
    putStrLn (show (cntNonDecreasingSeqs seq2))