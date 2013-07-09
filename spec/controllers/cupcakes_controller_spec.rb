require 'spec_helper'

describe CupcakesController do 
  describe 'GET #index' do
    it 'saves all cupcakes as instance variables' do
      cupcake = FactoryGirl.create(:cupcake)
      get :index
      assigns(:cupcakes).should eq [:cupcake]
    end
  end
end