require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      title_en: "MyString",
      title_ar: "MyString",
      name_en: "MyString",
      name_ar: "MyString",
      belongs_to: ""
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[title_en]"

      assert_select "input[name=?]", "employee[title_ar]"

      assert_select "input[name=?]", "employee[name_en]"

      assert_select "input[name=?]", "employee[name_ar]"

      assert_select "input[name=?]", "employee[belongs_to]"
    end
  end
end
