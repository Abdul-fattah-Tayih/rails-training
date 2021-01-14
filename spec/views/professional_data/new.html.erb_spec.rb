require 'rails_helper'

RSpec.describe "professional_data/new", type: :view do
  before(:each) do
    assign(:professional_datum, ProfessionalDatum.new(
      job_title_en: "MyString",
      job_title_ar: "MyString",
      user: nil
    ))
  end

  it "renders new professional_datum form" do
    render

    assert_select "form[action=?][method=?]", professional_data_path, "post" do

      assert_select "input[name=?]", "professional_datum[job_title_en]"

      assert_select "input[name=?]", "professional_datum[job_title_ar]"

      assert_select "input[name=?]", "professional_datum[user_id]"
    end
  end
end
