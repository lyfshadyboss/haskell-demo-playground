import           Data.Char (toUpper)
import           System.IO

main::IO()
main = do
        inh <- openFile "_input.txt" ReadMode
        outh <- openFile "_output.txt" WriteMode
        mainloop inh outh
        hClose inh
        hClose outh

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh =
        do ineof <- hIsEOF inh
           if ineof
               then return ()
               else do inpStr <- hGetLine inh
                       hPutStrLn outh (map toUpper inpStr)
                       mainloop inh outh
