require 'rails_helper'

RSpec.describe "professional_data/show", type: :view do
  before(:each) do
    @professional_datum = assign(:professional_datum, ProfessionalDatum.create!(
      job_title_en: "Job Title En",
      job_title_ar: "Job Title Ar",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Job Title En/)
    expect(rendered).to match(/Job Title Ar/)
    expect(rendered).to match(//)
  end
end
