require "rails_helper"

RSpec.describe ProfessionalDataController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/professional_data").to route_to("professional_data#index")
    end

    it "routes to #new" do
      expect(get: "/professional_data/new").to route_to("professional_data#new")
    end

    it "routes to #show" do
      expect(get: "/professional_data/1").to route_to("professional_data#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/professional_data/1/edit").to route_to("professional_data#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/professional_data").to route_to("professional_data#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/professional_data/1").to route_to("professional_data#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/professional_data/1").to route_to("professional_data#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/professional_data/1").to route_to("professional_data#destroy", id: "1")
    end
  end
end
