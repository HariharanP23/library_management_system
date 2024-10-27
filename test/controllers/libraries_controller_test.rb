# frozen_string_literal: true

require 'test_helper'

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test 'should get index' do
    get libraries_url
    assert_response :success
  end

  test 'should get new' do
    get new_library_url
    assert_response :success
  end

  test 'should create library' do
    assert_difference('Library.count') do
      post libraries_url,
           params: { library: { email: @library.email, established_date: @library.established_date,
                                library_id: @library.library_id, location: @library.location, name: @library.name, opening_hours_end: @library.opening_hours_end, opening_hours_start: @library.opening_hours_start } }
    end

    assert_redirected_to library_url(Library.last)
  end

  test 'should show library' do
    get library_url(@library)
    assert_response :success
  end

  test 'should get edit' do
    get edit_library_url(@library)
    assert_response :success
  end

  test 'should update library' do
    patch library_url(@library),
          params: { library: { email: @library.email, established_date: @library.established_date,
                               library_id: @library.library_id, location: @library.location, name: @library.name, opening_hours_end: @library.opening_hours_end, opening_hours_start: @library.opening_hours_start } }
    assert_redirected_to library_url(@library)
  end

  test 'should destroy library' do
    assert_difference('Library.count', -1) do
      delete library_url(@library)
    end

    assert_redirected_to libraries_url
  end
end
