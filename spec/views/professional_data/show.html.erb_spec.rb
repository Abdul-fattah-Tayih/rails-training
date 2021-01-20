require 'rails_helper'

RSpec.describe "professional_data/show", type: :view do
  before(:each) do
    @professional_data = assign(:professional_data, ProfessionalData.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
