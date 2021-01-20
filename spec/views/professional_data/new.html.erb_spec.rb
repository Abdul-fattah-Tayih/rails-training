require 'rails_helper'

RSpec.describe "professional_data/new", type: :view do
  before(:each) do
    assign(:professional_data, ProfessionalData.new())
  end

  it "renders new professional_data form" do
    render

    assert_select "form[action=?][method=?]", professional_data_path, "post" do
    end
  end
end
