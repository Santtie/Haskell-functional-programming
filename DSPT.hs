import Data.List
import Data.Fixed (mod')

-- funcion a(k)

a :: Int -> Int -> Double
a k n 
    | k == 0 = sqrt ( 1/ fromIntegral n)
    | otherwise = sqrt (2 / fromIntegral n)

-- Función para un valor x(k)
xk :: [Double] -> Int -> Double
xk xs k = (a k n) * sum [ xs !! m * cos (((fromIntegral m + 0.5) * pi * fromIntegral k) / fromIntegral n) | m <- [0..(n-1)] ]
    where n = length xs

-- Transformada completa de DCT
dct :: [Double] -> [Double]
dct xs = [ xk xs k | k <- [0..(n-1)] ]
    where n = length xs

