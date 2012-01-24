require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "should return a typeahead result" do
    widget = FactoryGirl.create(:widget)
    version = FactoryGirl.create(:version, :widget_id => widget.id, :title => "Sassafrass")
    widget.version_id = version.id
    widget.save

    get :search, {:q => "sass"}
    assert_not_nil assigns(:searchresults), "@searchresults has been assigned"
    assert_equal "Sassafrass", assigns(:searchresults).first.title, "Search result correctly returned"
  end

  test "default sort should be average_rating" do
    assert_equal "average_rating desc", @controller.send(:get_sort)
  end

end
