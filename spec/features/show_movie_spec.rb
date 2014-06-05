require 'spec_helper'

describe 'Viewing an individual movie' do

  it 'shows the movie details' do
    # movie = Movie.create(title: 'Iron Man',
    #                      rating: 'PG-13',
    #                      total_gross: 318412101.00,
    #                      description: 'Tony Stark builds an armored suit to fight the throes of evil',
    #                      released_on: '2008-05-02')

    movie = Movie.create(movie_attributes)
    # visit "http://example.com/movies/#{movie.id}"
    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    # expect(page).to have_text('$318,412,101')
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
  end

  it 'shows the total gross if >$50M' do
    movie = Movie.create(movie_attributes(total_gross: 500_000_000.00))
    visit movie_url(movie)
    expect(page).to have_text('$500,000,000')
  end
  it 'shows flop! if total gross <$50M' do
    movie = Movie.create(movie_attributes(total_gross: 100_000.00))
    visit movie_url(movie)
    expect(page).to have_text('Flop!')
  end

end