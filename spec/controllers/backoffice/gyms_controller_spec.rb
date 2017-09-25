require 'rails_helper'

RSpec.describe Backoffice::GymsController, type: :controller do
  describe "GET #index" do

    let!(:gym) { create(:gym) }

    before do
      create_list(:gym, 5)
      get :index

    end

    it "returns the correct response" do
      expect(response).to be_success
    end

    it "assigns records to @gyms" do
      expected_gyms = [
        gym
      ]

      expect(assigns(:gyms)).to eq(expected_gyms)
    end

    context 'when the gyms are searched' do


      it "assigns @gyms to result" do
        get :index, params: { query: gym.name }
        expect(assigns(:gyms).to include(gym))
      end
    end
  end


end
