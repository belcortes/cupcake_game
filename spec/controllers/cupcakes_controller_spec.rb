require 'spec_helper'

describe CupcakesController do 
  describe 'collection' do
    describe 'GET #index' do
      it 'saves all cupcakes as instance variables' do
        cupcake = create(:cupcake)
        get :index
        assigns(:cupcake).should eq [cupcake]
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
    # let(:invalid_cupcake) {create(:invalid_cupcake)}

    describe 'GET #edit' do
      before do
        get :edit, id: cupcake
      end
      it 'assigns the given cupcake as an instance variable' do
        assigns(:cupcake).should eq cupcake
      end
      it 'renders the :edit view' do
        response.should render_template :edit
      end
    end

    describe 'PUT #update' do
      # let(:cupcake) {create :cupcake}
      context 'valid attributes' do
        # before {put :update, id: cupcake, cupcake: attributes_for(:cupcake)}
        it 'assigns the given cupcake to an instace variable' do
          put :update, id: cupcake, cupcake: attributes_for(:cupcake)
          assigns(:cupcake).should eq cupcake
        end
        it 'changes the attributes of the cupcake' do
          expect {
            put :update, id: cupcake, cupcake: attributes_for(:cupcake, name: 'updated name')
            cupcake.reload
          }.to change{cupcake.name}.to('updated name')
          
        end

        it 'redirects to :index/cupcake_id' do
          put :update, id: cupcake, cupcake: attributes_for(:cupcake)
          response.should redirect_to cupcake_path(cupcake)
        end
      end

      context 'invalid attributes' do
        before {put :update, id: cupcake, invalid_cupcake: attributes_for(:invalid_cupcake)}
        it 'assigns the given cupcake to an instace variable' do
          assigns(:cupcake).should eq(cupcake)
        end
        it 'does not change the attributes of the cupcake' do 
          expect {
            put :update, id: cupcake, invalid_cupcake: attributes_for(:invalid_cupcake, name:"Bel")
            cupcake.reload
          }.to_not change{cupcake.name}.to('Bel')
        end
        it 're-renders :edit' do
          pending
          # put :update, id: cupcake, cupcake: attributes_for(:invalid_cupcake)
          # response.should render_template :edit
        end
      end
    end
    
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