require 'spec_helper'

describe ToppingsController do 
  describe 'collection' do
    describe 'GET #index' do
      it 'saves all toppings as instance variables' do
        topping = FactoryGirl.create(:topping)
        get :index
        assigns(:toppings).should eq [topping]
      end
    end

    describe 'GET #new' do
      let(:topping) {mock_model(Topping).as_new_record}
      before {topping.stub(:new).and_return(topping)}

      it 'saves the given topping as an instance variable' do
        get :new
        assigns(:topping).should be_a(Topping)
        assigns(:topping).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:topping) {mock_model(Topping).as_null_object}

      before {Topping.stub(:new).and_return(topping)}

      context 'when save succeeds' do
        it 'saves the topping' do
          topping.should_receive(:save)
          post :create
        end
        it 'redirects to :index' do
          post :create
          response.should redirect_to toppings_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          topping.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end
      end
    end


  end

  describe 'member' do
    let(:topping) {create(:topping)}
    
    describe 'DELETE #destroy' do

      it "deletes the topping" do 
        topping.reload
        expect{ 
          delete :destroy, id: topping 
        }.to change{Topping.count}.by -1
       end 
      it "redirects to toppings#index" do 
        delete :destroy, id: topping 
        response.should redirect_to toppings_path
      end 

    end
  end
end