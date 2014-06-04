require 'spec_helper'

describe 'navigating movies' do

  it 'allows nav from detail to all movies' do
    movie = Movie.create(movie_attributes)
    visit movie_url(movie)
    click_link 'All Movies'
    expect(current_path).to eql(movies_path)
  end

  it 'allows nav from all movies to detail' do
    movie = Movie.create(movie_attributes(title: 'Iron Man'))
    visit movies_url
    click_link 'Iron Man'
    expect(current_path).to eql(movie_path(movie))
  end

end