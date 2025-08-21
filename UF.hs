extract :: [Float] -> Float -> Float ->  [Float]
extract xs min max = [ x | x <- xs, x >= min, x <= max]

orden_desc :: [Float] -> [Float]
orden_desc [] = []
orden_desc (x:xs) = insertar_desc x (orden_desc xs)

insertar_desc :: Float -> [Float] -> [Float]
insertar_desc y [] = [y]
insertar_desc y (z:zs)=
    if y >= z then y : z : zs
    else z : insertar_desc y zs

my_list :: [Float]
my_list = [3, 28, 14, 9, 11, 17, 21]