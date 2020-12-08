def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
   FROM books
   WHERE series_id = 1
   ORDER BY year
   ;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
   FROM characters
   ORDER BY LENGTH(motto) DESC
   LIMIT 1;
   "
end


def select_value_and_count_of_most_prolific_species
  "Select species, 
  COUNT(species)
  FROM characters 
  GROUP BY species
  ORDER BY species DESC
  LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series
  ON authors.id = series.author_id
  INNER JOIN subgenres
  ON subgenres.id = series.subgenre_id
  ;"
end

def select_series_title_with_most_human_characters
   "SELECT series.title
   FROM series
   JOIN books
   ON series.id = books.series_id
   JOIN character_books
   ON books.id = character_books.book_id
   JOIN characters
   ON character_books.character_id = characters.id
   WHERE characters.species = 'human'
   GROUP BY series.title
   ORDER BY COUNT(*) DESC
   LIMIT 1;"
  
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*)
  AS book_count
  FROM character_books
  JOIN characters
   ON characters.id = character_books.character_id
   GROUP BY characters.name
   ORDER BY book_count DESC, characters.name; "
end
