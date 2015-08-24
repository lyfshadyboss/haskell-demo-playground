import           Data.Char (digitToInt)

loop :: Int->String->Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

asInt xs = loop 0 xs

foldlSum xs = foldl step 0 xs
    where step acc x = acc + x

niceSum xs = foldl (+) 0 xs
