# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord

  def characters
   return matching_characters = Character.where({ :actor_id => self.id })
  end

  def filmography
    #challenge for many-many associations
    #return all the actor's movies 
    
    my_chars = self.characters
    #my_id = self.id
    #my_chars = Character.where({ :actor_id => my_id })
   
   #movie_ids = my_chars.map_relation_to_array(:movie_id) does the same thing as below 
    movie_ids = []

    my_chars.each do |a_char|
      movie_ids.push(a_char.movie_id)
    end 

    my_films = Movie.where({ :id => movie_ids })

    return my_films 
  end
end
