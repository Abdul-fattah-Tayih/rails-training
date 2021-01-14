require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        title_en: "Title En",
        title_ar: "Title Ar",
        name_en: "Name En",
        name_ar: "Name Ar",
        belongs_to: ""
      ),
      Employee.create!(
        title_en: "Title En",
        title_ar: "Title Ar",
        name_en: "Name En",
        name_ar: "Name Ar",
        belongs_to: ""
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "Title En".to_s, count: 2
    assert_select "tr>td", text: "Title Ar".to_s, count: 2
    assert_select "tr>td", text: "Name En".to_s, count: 2
    assert_select "tr>td", text: "Name Ar".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
