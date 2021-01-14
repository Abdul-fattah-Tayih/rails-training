require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      title_en: "Title En",
      title_ar: "Title Ar",
      name_en: "Name En",
      name_ar: "Name Ar",
      belongs_to: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title En/)
    expect(rendered).to match(/Title Ar/)
    expect(rendered).to match(/Name En/)
    expect(rendered).to match(/Name Ar/)
    expect(rendered).to match(//)
  end
end
