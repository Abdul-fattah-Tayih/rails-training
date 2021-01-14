require 'rails_helper'

RSpec.describe "professional_data/edit", type: :view do
  before(:each) do
    @professional_datum = assign(:professional_datum, ProfessionalDatum.create!(
      job_title_en: "MyString",
      job_title_ar: "MyString",
      user: nil
    ))
  end

  it "renders the edit professional_datum form" do
    render

    assert_select "form[action=?][method=?]", professional_datum_path(@professional_datum), "post" do

      assert_select "input[name=?]", "professional_datum[job_title_en]"

      assert_select "input[name=?]", "professional_datum[job_title_ar]"

      assert_select "input[name=?]", "professional_datum[user_id]"
    end
  end
end
