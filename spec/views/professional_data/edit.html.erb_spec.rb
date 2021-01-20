require 'rails_helper'

RSpec.describe "professional_data/edit", type: :view do
  before(:each) do
    @professional_data = assign(:professional_data, ProfessionalData.create!())
  end

  it "renders the edit professional_data form" do
    render

    assert_select "form[action=?][method=?]", professional_data_path(@professional_data), "post" do
    end
  end
end
