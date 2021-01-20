require 'rails_helper'

RSpec.describe "professional_data/index", type: :view do
  before(:each) do
    assign(:professional_data, [
      ProfessionalData.create!(),
      ProfessionalData.create!()
    ])
  end

  it "renders a list of professional_data" do
    render
  end
end
