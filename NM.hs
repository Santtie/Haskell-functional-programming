-- NM.hs

-- Recursive replacement of factorial (no product)
factorial :: Integer -> Double
factorial 0 = 1
factorial n
  | n < 0     = error "factorial: negative input"
  | otherwise = fromIntegral n * factorial (n-1)

-- Recursive replacement of sum
mySum :: [Double] -> Double
mySum []     = 0
mySum (x:xs) = x + mySum xs

-- Exponential approximation using Maclaurin series
expApprox :: Double -> Int -> Double
expApprox x n = mySum [ x^k / factorial (fromIntegral k) | k <- [0..n-1] ]

-- Cosine approximation using Maclaurin series
cosApprox :: Double -> Int -> Double
cosApprox x n = mySum [ ((-1)^k) * (x^(2*k)) / factorial (fromIntegral (2*k)) | k <- [0..n-1] ]

-- Natural log (ln(1+x)) approximation using Taylor series
ln1pApprox :: Double -> Int -> Double
ln1pApprox x n = mySum [ ((-1)^(k+1)) * (x^k) / fromIntegral k | k <- [1..n-1] ]

-- Percent error calculation
percentError :: Double -> Double -> Double
percentError approx real = abs ((real - approx) / real) * 100

-- Main test runner
main :: IO ()
main = do
    let x = 1.5
        n = 6

    putStrLn $ "\nApproximation of e^" ++ show x ++ " with N=" ++ show n
    let approxExp = expApprox x n
        realExp   = exp x
    putStrLn $ "Approx = " ++ show approxExp
    putStrLn $ "Real   = " ++ show realExp
    putStrLn $ "Error % = " ++ show (percentError approxExp realExp)

    putStrLn $ "\nApproximation of cos(" ++ show x ++ ") with N=" ++ show n
    let approxCos = cosApprox x n
        realCos   = cos x
    putStrLn $ "Approx = " ++ show approxCos
    putStrLn $ "Real   = " ++ show realCos
    putStrLn $ "Error % = " ++ show (percentError approxCos realCos)

    putStrLn $ "\nApproximation of ln(1+" ++ show x ++ ") with N=" ++ show n
    let approxLn = ln1pApprox x n
        realLn   = log (1 + x)
    putStrLn $ "Approx = " ++ show approxLn
    putStrLn $ "Real   = " ++ show realLn
    putStrLn $ "Error % = " ++ show (percentError approxLn realLn)
