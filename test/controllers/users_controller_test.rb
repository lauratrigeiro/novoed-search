require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get search" do
    get :search
    assert_response :success
    assert_select "title", "NovoedFinder"
    assert_select "form", 1
    assert_select "table", false, "A page with no query shows no table"  
  end

  test "search form should display corrent search results" do
  	# Blank search returns all users
  	get :search, {'search_by' => "country", 'query' => ''}
  	assert_select "table", true, "A page with a query shows a table"
  	# Add 1 to number of results because of header row
  	assert_select "tr", User.count + 1
  	# search for city of "fran" returns users from San Francisco and Frankfurt
	get :search, {'search_by' => "city", 'query' => 'fran'}
	assert_select "tr", 2 + 1
	assert_match "San Francisco", response.body
	assert_match "Frankfurt", response.body
	# search for state of "fo" returns just user from San Francisco
	get :search, {'search_by' => "state", 'query' => 'fo'}
	assert_select "tr", 1 + 1
	assert_match "San Francisco", response.body
	# search for non-included country returns no search results
	get :search, {'search_by' => "country", 'query' => 'France'}
	assert_select "table", 0
	assert_match "No search results found.", response.body
  end

end
