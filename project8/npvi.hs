------------------------------------
-- nPVI Pairs ----------------------
-- Dustin McMahon ------------------
-- 11/27/2022 ----------------------
------------------------------------

-- Test Data
a :: [Int]
a = [2,5,1,3]

b :: [Int]
b = [1,3,6,2,5]

c :: [Int]
c = [4,4,2,1,1,2,2,4,4,8]

u :: [Int]
u = [2,2,2,2,2,2,2,2,2,2]

x :: [Int]
x = [1,9,2,8,3,7,2,8,1,9]


------------------------------------
-- pairwiseValues :: pairs a number with the next in the list
-- 1 param :: list of ints
pairwiseValues :: [Int] -> [(Int,Int)]
pairwiseValues list = zip ( init list ) ( tail list )

------------------------------------
-- pairwiseDifferences :: the difference between the pairwiseValues of the list
-- 1 param :: list of ints
pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences list = map ( \(x,y) -> x - y ) ( pairwiseValues list )

------------------------------------
-- pairwiseSums :: the sum of the pairwiseValues of the list
-- 1 param :: list of ints
pairwiseSums :: [Int] -> [Int]
pairwiseSums list = map ( \(x,y) -> x + y ) ( pairwiseValues list )

------------------------------------
-- half :: GIVEN CODE half the given value
-- 1 param :: int value
half :: Int -> Double
half number = ( fromIntegral number ) / 2

------------------------------------
-- pairwiseHalves :: halve the values of all ints in list
-- 1 param :: list of ints
pairwiseHalves :: [Int] -> [Double]
pairwiseHalves list = map half list

------------------------------------
-- pairwiseHalfSums :: sum the list then divide by 2
-- 1 param :: list of ints
pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums list = pairwiseHalves ( pairwiseSums list )

------------------------------------
-- pairwiseTermPairs :: list of pairs [(difference,halfSum)...] given a list
-- 1 param :: list of ints
pairwiseTermPairs :: [Int] -> [(Int,Double)]
pairwiseTermPairs list = zip ( pairwiseDifferences list ) ( pairwiseHalfSums list )

------------------------------------
-- term :: GIVEN CODE term value given pair (a,b) = absolute(a/b)
-- 1 param :: int value
term :: (Int,Double) -> Double
term ndPair = abs ( fromIntegral ( fst ndPair ) / ( snd ndPair ) )

------------------------------------
-- pairwiseTerms :: list of terms give a list
-- 1 param :: list of ints
pairwiseTerms :: [Int] -> [Double]
pairwiseTerms list = map term ( pairwiseTermPairs list )

------------------------------------
-- nPVI :: GIVEN CODE term value given pair (a,b) = absolute(a/b)
-- 1 param :: int value
nPVI :: [Int] -> Double
nPVI xs = normalizer xs * sum ( pairwiseTerms xs )
    where normalizer xs = 100 / fromIntegral ( ( length xs ) - 1 )

