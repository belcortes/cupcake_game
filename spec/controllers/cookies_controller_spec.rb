require 'spec_helper'

describe CookiesController do

    describe 'collection' do
      describe 'GET #index' do
        it 'gets all of the cookies' do
          cookie = create(:cooky)
          get :index
          assigns(:cookies).should eq [cookie]
        end
      end
    end



end