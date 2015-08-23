-- foldl :: (a -> b -> a) -> a -> [b] -> a
-- foldl step zero (x:xs) = foldl step (step zero x) xs
-- foldl _    zero []     = zero
--
-- foldl (+) 0 (1:2:3:[])
--           == foldl (+) (0 + 1)             (2:3:[])
--           == foldl (+) ((0 + 1) + 2)       (3:[])
--           == foldl (+) (((0 + 1) + 2) + 3) []
--           ==           (((0 + 1) + 2) + 3)
--
--
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr step zero (x:xs) = step x (foldr step zero xs)
-- foldr _    zero []     = zero
--
-- foldr (+) 0 (1:2:3:[])
--           == 1 +           foldr (+) 0 (2:3:[])
--           == 1 + (2 +      foldr (+) 0 (3:[])
--           == 1 + (2 + (3 + foldr (+) 0 []))
--           == 1 + (2 + (3 + 0))
--
--
-- =========================================================
-- myFoldl :: (a -> b -> a) -> a -> [b] -> a
-- myFoldl f z xs = foldr step id xs z
--     where step x g a = g (f a x)
--
-- myFoldl (+) 0 (1:2:3:[])
--           == foldr step1 id (1:2:3:[]) 0
--           == step1 1 (foldr step2 id (2:3:[])) 0
--           == step1 1 (step2 2 (foldr step3 id (3:[]))) 0
--           == step1 1 (step2 2 (step3 3 (foldr step4 id []))) 0
--           == step1 1 (step2 2 (step3 3 id)) 0
--           == step2 2 (step3 3 id) (+ 0 1)
--           == step3 3 id (+ (+ 0 1) 2)
--           == id (+ (+ (+ 0 1) 2) 3)
--           == (+ (+ (+ 0 1) 2) 3)
module Main where

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f z xs = foldr step id xs z
    where step x g a = g (f a x)

main :: IO ()
main = print (myFoldl (+) (0::Int) [1, 2, 3])
