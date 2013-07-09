require 'spec_helper'

describe CupcakesController do 
  describe 'collection' do
    describe 'GET #index' do
      it 'saves all cupcakes as instance variables' do
        cupcake = FactoryGirl.create(:cupcake)
        get :index
        assigns(:cupcakes).should eq [cupcake]
      end
    end

    describe 'GET #new' do
      let(:cupcake) {mock_model(Cupcake).as_new_record}
      before {cupcake.stub(:new).and_return(cupcake)}

      it 'saves the given cupcake as an instance variable' do
        get :new
        assigns(:cupcake).should be_a(Cupcake)
        assigns(:cupcake).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:cupcake) {mock_model(Cupcake).as_null_object}

      before {Cupcake.stub(:new).and_return(cupcake)}

      context 'when save succeeds' do
        it 'saves the cupcake' do
          cupcake.should_receive(:save)
          post :create
        end
        it 'redirects to :index' do
          post :create
          response.should redirect_to cupcakes_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          cupcake.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end
      end
    end


  end

  describe 'member' do
    let(:cupcake) {create(:cupcake)}
    
    describe 'DELETE #destroy' do

      it "deletes the cupcake" do 
        cupcake.reload
        expect{ 
          delete :destroy, id: cupcake 
        }.to change{Cupcake.count}.by -1
       end 
      it "redirects to cupcakes#index" do 
        delete :destroy, id: cupcake 
        response.should redirect_to cupcakes_path
      end 

    end
  end
end