------------------------------------
-- Haskell Project 8 ---------------
-- Dustin McMahon ------------------
-- 11/27/2022 ----------------------
------------------------------------

------------------------------------
-- squareArea :: area of a square
-- 1 param :: side length
squareArea :: Num a => a -> a
squareArea side = side * side

------------------------------------
-- circleArea :: area of a circle
-- 1 param :: radius length
circleArea :: Fractional f => f -> f
circleArea radius = 3.141592653589793238 * ( radius * radius )

------------------------------------
-- blueAreaOfCube :: blue area of a cube
---- explained as a cube with 6 blue sides with a white dot
---- dot radius is 1/4 the side
-- 1 param :: side length
blueAreaOfCube :: Fractional f => f -> f
blueAreaOfCube side = sideArea * 6
    where sideArea = squareArea side - circleArea radius
          radius = side / 4

------------------------------------
-- paintedCube1 :: number of cubes with 1 side painted
---- painted cube disected into an NxNxN cube
-- 1 param :: order of cube (N)
paintedCube1 :: ( Ord a, Num a) => a -> a
paintedCube1 n = 
    if (n < 3 ) then 0 else
    sideCount * 6
    where sideCount = ( n - 2 ) * ( n - 2 )

------------------------------------
-- paintedCube2 :: number of cubes with 2 side painted
---- painted cube disected into an NxNxN cube
-- 1 param :: order of cube (N)
paintedCube2 :: ( Ord a, Num a ) => a -> a
paintedCube2 n = 
    if (n < 3 ) then 0 else
    sideCount * 6
    where sideCount = ( n - 2 ) * 2

------------------------------------
-- reverseWords :: reverse the order of the words in a string
-- 1 param :: character string
reverseWords :: String -> String
reverseWords input = unwords reversed
    where reversed = reverse wordList
          wordList = words input

------------------------------------
-- averageWordLength :: average length of the words in the phrase
-- 1 param :: character string
averageWordLength :: Fractional a => String -> a
averageWordLength input = fromIntegral charTotal / fromIntegral wordCount
    where charTotal = sum lengthMap
          wordCount = length lengthMap
          lengthMap = map ( \x -> length x ) inputList
          inputList = words input

------------------------------------
-- list2set :: removes any duplicates from the list
-- 1 param :: list of objects
list2set [] = []
list2set theList = headObject : list2set filteredTail
    where filteredTail = filter ( \x -> x /= headObject) tailObject
          headObject = head theList
          tailObject = tail theList

------------------------------------
-- isPalindrome :: True if reads the same forward as backward
-- 1 param :: list of objects
isPalindrome [] = True
isPalindrome theList =
    if ( length theList == 1 ) then True else
    if ( firstObject == lastObject ) then isPalindrome newList else False
    where newList = init tailList
          tailList = tail theList
          firstObject = head theList
          lastObject = last theList

------------------------------------
-- collatz :: collatz sequence given x
-- 1 param :: pos number greater than 0
collatz 1 = [1]
collatz x = x : rest
    where rest = if( modX == 0) then collatz smallerVal else collatz largerVal
          modX = x `mod` 2
          smallerVal = x `div` 2
          largerVal = (( 3 * x ) + 1 )

------------------------------------
-- count :: count elements occurance within a list
-- 2 param :: element, list of same type as element
count elem theList = length [ x | x <- theList, x == elem ]

------------------------------------
-- freqTable :: list of pairs [(uniqueElement, count),...]
-- 1 param :: list of elements
freqTable theList = [ ( x, count x theList ) | x <- uniqueList ]
    where uniqueList = list2set theList

------------------------------------
-- tgl :: triangular number of x
-- 1 param :: x (the number)
tgl 1 = 1
tgl x = x + tgl (x-1)

------------------------------------
-- triangleSequence :: triangular Sequence from 1 to x
-- 1 param :: x (the number)
triangleSequence x = map tgl [1..x]

------------------------------------
-- vowelCount :: count vowels in a string
-- 1 param :: the string
vowelCount theString = length vowelList
    where vowelList = filter ( \x -> elem x "aeiou" ) theString

------------------------------------
-- lcsim :: list comprehension simulation
-- 3 param :: [ f x | x <- xs, p x ]
---- map function
---- predicate
---- list
lcsim mapFunc pred theList = [ mapFunc x | x <- theList, pred x ]
