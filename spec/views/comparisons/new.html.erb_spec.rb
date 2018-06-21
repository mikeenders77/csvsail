require 'rails_helper'

RSpec.describe "comparisons/new", type: :view do
  before(:each) do
    assign(:comparison, Comparison.new(
      :company => "MyString",
      :textFile => "MyString",
      :csvFile => "MyString",
      :downloadUrl => "MyString"
    ))
  end

  it "renders new comparison form" do
    render

    assert_select "form[action=?][method=?]", comparisons_path, "post" do

      assert_select "input[name=?]", "comparison[company]"

      assert_select "input[name=?]", "comparison[textFile]"

      assert_select "input[name=?]", "comparison[csvFile]"

      assert_select "input[name=?]", "comparison[downloadUrl]"
    end
  end
end
