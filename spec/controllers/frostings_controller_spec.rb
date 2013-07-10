require 'spec_helper'

describe FrostingsController do

  describe 'collection' do
    describe 'GET #index' do
      it 'gets all of the frostings' do
        frosting = create(:frosting)
        get :index
        assigns(:frostings).should eq [frosting]
      end
    end

    describe 'GET #new' do
      let(:frosting) {mock_model(Frosting).as_new_record}
      before {frosting.stub(:new).and_return(frosting)}

      it 'saves the given frosting as an instance variable' do
        get :new
        assigns(:frosting).should be_a(Frosting)
        assigns(:frosting).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:frosting) {mock_model(Frosting).as_null_object}

      before {Frosting.stub(:new).and_return(frosting)}

      context 'when save succeeds' do
        it 'saves the frosting' do
          frosting.should_receive(:save)
          post :create
        end
        it 'redirects to :index' do
          post :create
          response.should redirect_to frostings_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          frosting.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end
      end
    end


  end

  describe 'member' do
    let(:frosting) {create(:frosting)}
    describe 'DELETE #destroy' do

      it "deletes the frosting" do 
        frosting.reload
        expect{ 
          delete :destroy, id: frosting 
        }.to change{Frosting.count}.by -1
       end 
      it "redirects to frostings#index" do 
        delete :destroy, id: frosting 
        response.should redirect_to frostings_path
      end 

    end
  end
  



end