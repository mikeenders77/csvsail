require 'rails_helper'

RSpec.describe "comparisons/index", type: :view do
  before(:each) do
    assign(:comparisons, [
      Comparison.create!(
        :company => "Company",
        :textFile => "Text File",
        :csvFile => "Csv File",
        :downloadUrl => "Download Url"
      ),
      Comparison.create!(
        :company => "Company",
        :textFile => "Text File",
        :csvFile => "Csv File",
        :downloadUrl => "Download Url"
      )
    ])
  end

  it "renders a list of comparisons" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Text File".to_s, :count => 2
    assert_select "tr>td", :text => "Csv File".to_s, :count => 2
    assert_select "tr>td", :text => "Download Url".to_s, :count => 2
  end
end
