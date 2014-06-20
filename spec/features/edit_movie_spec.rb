require 'spec_helper'

describe 'edit a movie' do

  it 'updates the movie and shows updated details' do
    movie = Movie.create(movie_attributes)
    visit movie_url(movie)
    click_link 'Edit'

    # check that links work
    expect(current_path).to eql(edit_movie_path(movie))
    expect(find_field('Title').value).to eql(movie.title)

    fill_in 'Title', with: "Updated Movie Title"
    click_button 'Update Movie'
    
    # check that update works
    expect(current_path).to eq(movie_path(movie))
    expect(page).to have_text('Updated Movie Title')
  end

end