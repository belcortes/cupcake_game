require 'spec_helper'

describe IceCreamsController do

  describe 'collection' do
    describe 'GET #index' do
      it 'gets all of the ice_creams' do
        ice_cream = create(:ice_cream)
        get :index
        assigns(:ice_creams).should eq [ice_cream]
      end
    end

    describe 'GET #new' do
      let(:ice_cream) {mock_model(IceCream).as_new_record}
      before {ice_cream.stub(:new).and_return(ice_cream)}

      it 'saves the given ice_cream as an instance variable' do
        get :new
        assigns(:ice_cream).should be_a(IceCream)
        assigns(:ice_cream).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:ice_cream) {mock_model(IceCream).as_null_object}

      before {IceCream.stub(:new).and_return(ice_cream)}

      context 'when save succeeds' do
        it 'saves the ice_cream' do
          ice_cream.should_receive(:save)
          post :create
        end
        it 'redirects to :index' do
          post :create
          response.should redirect_to ice_creams_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          ice_cream.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end
      end
    end


  end

  describe 'member' do
    let(:ice_cream) {create(:ice_cream)}
    describe 'DELETE #destroy' do

      it "deletes the ice_cream" do 
        ice_cream.reload
        expect{ 
          delete :destroy, id: ice_cream 
        }.to change{IceCream.count}.by -1
       end 
      it "redirects to ice_creams#index" do 
        delete :destroy, id: ice_cream 
        response.should redirect_to ice_creams_path
      end 

    end
  end
  



end