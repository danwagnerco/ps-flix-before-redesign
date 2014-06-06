require 'spec_helper'

describe 'edit a movie' do

  it 'updates the movie and shows updated details' do
    movie = Movie.create(movie_attributes)
    visit movie_url(movie)
    click_link 'Edit'
    expect(current_path).to eql(edit_movie_path(movie))
    expect(find_field('Title').value).to eql(movie.title)
  end

end