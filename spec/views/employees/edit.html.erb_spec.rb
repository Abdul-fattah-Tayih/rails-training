require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      title_en: "MyString",
      title_ar: "MyString",
      name_en: "MyString",
      name_ar: "MyString",
      belongs_to: ""
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[title_en]"

      assert_select "input[name=?]", "employee[title_ar]"

      assert_select "input[name=?]", "employee[name_en]"

      assert_select "input[name=?]", "employee[name_ar]"

      assert_select "input[name=?]", "employee[belongs_to]"
    end
  end
end
