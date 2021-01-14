require 'rails_helper'

RSpec.describe "professional_data/index", type: :view do
  before(:each) do
    assign(:professional_data, [
      ProfessionalDatum.create!(
        job_title_en: "Job Title En",
        job_title_ar: "Job Title Ar",
        user: nil
      ),
      ProfessionalDatum.create!(
        job_title_en: "Job Title En",
        job_title_ar: "Job Title Ar",
        user: nil
      )
    ])
  end

  it "renders a list of professional_data" do
    render
    assert_select "tr>td", text: "Job Title En".to_s, count: 2
    assert_select "tr>td", text: "Job Title Ar".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
