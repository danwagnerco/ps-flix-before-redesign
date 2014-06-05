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
end