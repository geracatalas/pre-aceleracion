namespace :db do
    desc "Populate local/staging data for testing purpose"
      task populate: :environment do
  
      # Genres

      scifi_genre = Genre.create!(
        image: "image",
        name: "Sci-Fi"
      )

      action_genre = Genre.create!(
        image: "image",
        name: "Action"
      )

      fantasy_genre = Genre.create!(
        image: "image",
        name: "Fantasy"
      )
  
      # Movies

      spiderman = Movie.create!(
        genre: scifi_genre,
        image: "https://pics.filmaffinity.com/spider_man_spiderman-945131720-large.jpg",
        title: "Spider-Man",
        release_date: "15/05/2002",
        rating: 4
      )
  
  
      Character.create!(
        movie: spiderman,
        image: "https://pics.filmaffinity.com/spider_man_spiderman-945131720-large.jpg",
        name: "Peter Parker",
        age: 28,
        weight: 76,
        history: "Peter Parker, a poor sickly orphan, is bitten by a radioactive spider. As a result of the bite, he gains superhuman strength, speed, and agility along with the ability to cling to walls.",
      )

      Character.create!(
        movie: spiderman,
        image: "https://upload.wikimedia.org/wikipedia/commons/b/b8/Kirsten_Dunst_Cannes.jpg",
        name: "Mary Jane Watson",
        age: 27,
        weight: 54,
        history: "Mary Jane Watson was born to Philip and Madeline Watson. She is the second of two children, with her elder sister Gayle having been born four years earlier. Due to her family's constant moving (as a result of her father's various teaching jobs)",
      )
    end
  end