# Practice Report – Functional Programming in Haskell

This repository contains the solutions for the first practice of Functional Programming.  
It is divided into three parts:

- **UF.hs** → Utility functions  
- **DSPT.hs** → Discrete Signal Processing Transform (DCT)  
- **NM.hs** → Numerical Methods (series approximations)  

Each file is self-contained, follows the restrictions of the assignment, and includes a `main` function with example executions.

---

## 1. UF – Utility Functions

**File:** `UF.hs`  

Implemented functions:
- `remData :: [Float] -> Float -> Float -> [Float]`  
  Removes all elements of a list that are outside the given range `[min, max]`.
- `orderDesc :: [Float] -> [Float]`  
  Orders a list of floats in descending order using insertion.
- `insertDesc :: Float -> [Float] -> [Float]`  
  Helper function for `orderDesc`.
- `my_list :: [Float]`  
  Example list: `[3, 28, 14, 9, 11, 17, 21]`.

**Usage example:**
```haskell
ghci> :load UF.hs
ghci> remData my_list 10 20
[14.0,11.0,17.0]
ghci> orderDesc my_list
[28.0,21.0,17.0,14.0,11.0,9.0,3.0]
```
## 2. DSPT – Discrete Signal Processing Transform

**File:** `DSPT.hs`  

**Implemented functions:**
- `a :: Int -> Int -> Double`  
  Normalization factor for the DCT.
- `xk :: [Double] -> Int -> Double`  
  Computes one coefficient of the DCT.
- `dct :: [Double] -> [Double]`  
  Computes the full Discrete Cosine Transform of a vector.

**Restrictions followed:**  
Manual implementations were written to replace restricted functions:  
- `mySum` (instead of `sum`)  
- `myLength` (instead of `length`)  
- `myIndex` (instead of `!!`)  
- `mySqrt` (instead of `sqrt`, implemented with Newton’s method)  

**Usage example:**
```haskell
ghci> :load DSPT.hs
ghci> dct [1,2,3,4]
[5.000000000000001,-2.230442497387663,0.0,-0.15851266778110717]
```
## 3. NM – Numerical Methods

**File:** `NM.hs`  

**Implemented functions:**
- `factorial :: Integer -> Double`  
  Recursive factorial without using `product`.
- `expApprox :: Double -> Int -> Double`  
  Approximation of `e^x` using the Maclaurin series.
- `cosApprox :: Double -> Int -> Double`  
  Approximation of `cos(x)` using the Maclaurin series.
- `ln1pApprox :: Double -> Int -> Double`  
  Approximation of `ln(1+x)` using the Taylor series.
- `percentError :: Double -> Double -> Double`  
  Computes the absolute percentage error.

**Restrictions followed:**  
Manual recursive implementations were written for:  
- `factorial` (instead of `product`)  
- `mySum` (instead of `sum`)  

**Usage example:**
```haskell
ghci> :load NM.hs
ghci> main

Approximation of e^1.5 with N=6
Approx = 4.481770833333334
Real   = 4.4816890703380645
Error % = 0.0018248865315263636

Approximation of cos(1.5) with N=6
Approx = 0.0707372016677029
Real   = 0.0707372016677029
Error % = 0.0

Approximation of ln(1+1.5) with N=6
Approx = 0.8864583333333334
Real   = 0.9162907318741551
Error % = 3.254757748669402
```

## 4. Troubles and Solutions

- **Restricted functions**  
  The assignment limited us to very few built-in functions (`+ - * / mod toEnum fromEnum fromIntegral cos`).  
  **Solution:** Implemented recursive versions of `sum`, `length`, indexing (`!!`), `factorial`, and square root (Newton’s method).

- **Numerical precision**  
  Approximations with few terms (`n` small) caused large errors.  
  **Solution:** Increasing `n` improved accuracy significantly.

- **DCT normalization**  
  Ensuring the correct normalization factor `a(k,n)` was crucial to match expected results.

---

## 5. Conclusions

- Functional programming in Haskell forces a **recursive mindset**, rebuilding even simple functions.  
- Implementing numerical methods manually shows **how series approximations converge** and highlights precision issues.  
- Splitting the practice into **UF, DSPT, and NM** demonstrates Haskell’s flexibility for both utility programming and mathematical computation.  
- Using **GitHub** helped track code and report writing in one place, keeping the practice reproducible and organized.

---

## Repository Structure

## Repository Structure
```
.
├── UF.hs # Utility functions
├── DSPT.hs # Discrete Signal Processing Transform
├── NM.hs # Numerical methods
└── README.md # This report
```

