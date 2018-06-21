require 'rails_helper'

RSpec.describe "comparisons/edit", type: :view do
  before(:each) do
    @comparison = assign(:comparison, Comparison.create!(
      :company => "MyString",
      :textFile => "MyString",
      :csvFile => "MyString",
      :downloadUrl => "MyString"
    ))
  end

  it "renders the edit comparison form" do
    render

    assert_select "form[action=?][method=?]", comparison_path(@comparison), "post" do

      assert_select "input[name=?]", "comparison[company]"

      assert_select "input[name=?]", "comparison[textFile]"

      assert_select "input[name=?]", "comparison[csvFile]"

      assert_select "input[name=?]", "comparison[downloadUrl]"
    end
  end
end
