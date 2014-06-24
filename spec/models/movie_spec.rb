require 'spec_helper'

describe 'A movie' do

  it 'should be a flop if total gross <$50M' do
    movie = Movie.new(total_gross: 100_000.00)
    expect(movie.flop?).to eql(true)
  end
  it 'should be a flop if total gross is blank' do
    movie = Movie.new(total_gross: nil)
    expect(movie.flop?).to eql(true)
  end
  it 'should not be a flop if toal gross >$50M' do
    movie = Movie.new(total_gross: 500_000_000.00)
    expect(movie.flop?).to eql(false)
  end
  it "is released when the released on date is in the past" do
  movie = Movie.create(movie_attributes(released_on: 3.months.ago))
 
  expect(Movie.released).to include(movie)
  end

  it "is not released when the released on date is in the future" do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))
    expect(Movie.released).not_to include(movie)
  end

  it "returns released movies ordered with the most recently-released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))
    expect(Movie.released).to eq([movie3, movie2, movie1])
  end

  it "returns hit movies (+300MM) ordered with the highest grossing movie first" do
    movie1 = Movie.create(movie_attributes(total_gross: 500_000_000))
    movie2 = Movie.create(movie_attributes(total_gross: 400_000_000))
    movie3 = Movie.create(movie_attributes(total_gross: 300_000_000))
    expect(Movie.hit).to eq([movie1, movie2, movie3])
  end

  it "returns flop movies (-50MM) ordered with the lowest grossing movie first" do
    movie1 = Movie.create(movie_attributes(total_gross: 49_000_000))
    movie2 = Movie.create(movie_attributes(total_gross: 48_000_000))
    movie3 = Movie.create(movie_attributes(total_gross: 47_000_000))
    expect(Movie.flop).to eq([movie3, movie2, movie1])
  end

end
