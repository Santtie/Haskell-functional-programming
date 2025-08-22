# Practice Report - Functional Programming in haskell

- ## Group members
- Laura Santamaría Espinosa
- Simón Díaz

- ## Coding platforms
- Visual Studio code
- Haskell extension
- GHCup

## 1. Introduction
This practice implements different functions in **Haskell** related to:
- List filtering and ordering.
- Sorting in descending order.
- Discrete cosine transform (DSPT).

The objective is to practice functional programming concepts such as recursion, list comprehensions, and higher-order functions.

---

## 2. How to use the functions

### 2.1 Extract elements in a range
```Haskell
extract :: [Float] -> Float -> Float -> [Float]
extract xs min max = [ x | x <- xs, x >= min, x <= max]

