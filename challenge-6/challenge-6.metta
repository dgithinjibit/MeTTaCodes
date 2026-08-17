;; ============================================================
;; CHALLENGE 6: Movie Search Engine - Pure MeTTa Version
;; ============================================================
;; This version demonstrates the concept without requiring Python

;; Movie database (same as challenge-6-database.metta)
(Movie Inception 2010)
(Movie TheMatrix 1999)
(Movie Interstellar 2014)
(Movie TheDarkKnight 2008)
(Movie Parasite 2019)
(Movie Dune 2021)
(Movie Avatar 2009)
(Movie TheShawshankRedemption 1994)

;; Query function: Find movies by year
(= (find-movies-by-year $year)
   (match &self (Movie $name $year) $name))

;; Example queries (demonstrating the search functionality)

;; Find movies from 2010
!(find-movies-by-year 2010)
;; Expected: Inception

;; Find movies from 1999
!(find-movies-by-year 1999)
;; Expected: TheMatrix

;; Find movies from 2021
!(find-movies-by-year 2021)
;; Expected: Dune

;; Find movies from 2019
!(find-movies-by-year 2019)
;; Expected: Parasite

;; NOTE: This demonstrates the same concept as the Python version
;; The Python version adds interactive user input, but the core
;; MeTTa query logic is identical to what's shown here.
