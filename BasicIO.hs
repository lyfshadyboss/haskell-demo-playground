name2replay :: String -> String
name2replay name =
        "Pleased to meet you, " ++ name ++ ".\n" ++
        "Your name contains " ++ charcount ++ " characters."
        where charcount = show (length name)

main::IO()
main = do
        putStrLn "Greeting! What is your name ?"
        inpStr <- getLine
        putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!"

        let outStr = name2replay inpStr
        putStrLn outStr
