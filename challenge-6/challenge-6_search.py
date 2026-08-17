#!/usr/bin/env python3
"""
CHALLENGE 6: Movie Search Engine - Daniel's Solution
"""

from hyperon import MeTTa, E, S, V

def search_movies_by_year():
    # Initialize MeTTa
    metta = MeTTa()
    
    # Load the database
    with open('challenge-6-database.metta', 'r') as f:
        metta.run(f.read())
    
    # Prompt user for year
    year_input = input("Enter a year to search for movies: ")
    
    try:
        year = int(year_input)
        
        # Query the space for movies from that year
        query = f"!(match &self (Movie $name {year}) $name)"
        results = metta.run(query)
        
        # Display results
        if results:
            print(f"\nMovies released in {year}:")
            for movie in results:
                print(f"  - {movie}")
        else:
            print(f"\nNo movies found for year {year}")
            
    except ValueError:
        print("Invalid year. Please enter a number.")

if __name__ == "__main__":
    search_movies_by_year()
