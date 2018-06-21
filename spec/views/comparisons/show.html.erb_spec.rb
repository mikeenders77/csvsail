require 'rails_helper'

RSpec.describe "comparisons/show", type: :view do
  before(:each) do
    @comparison = assign(:comparison, Comparison.create!(
      :company => "Company",
      :textFile => "Text File",
      :csvFile => "Csv File",
      :downloadUrl => "Download Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Text File/)
    expect(rendered).to match(/Csv File/)
    expect(rendered).to match(/Download Url/)
  end
end
