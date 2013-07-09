require 'spec_helper'

describe CookiesController do

  describe 'collection' do
    describe 'GET #index' do
      it 'gets all of the cookies' do
        cookie = create(:cookie)
        get :index
        assigns(:cookies).should eq [cookie]
      end
    end

    describe 'GET #new' do
      let(:cookie) {mock_model(Cookie).as_new_record}
      before {cookie.stub(:new).and_return(cookie)}

      it 'saves the given cookie as an instance variable' do
        get :new
        assigns(:cookie).should be_a(Cookie)
        assigns(:cookie).should be_new_record

      end
      it 'renders the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      let(:cookie) {mock_model(Cookie).as_null_object}

      before {Cookie.stub(:new).and_return(cookie)}

      context 'when save succeeds' do
        it 'saves the cookie' do
          cookie.should_receive(:save)
          post :create
        end
        it 'redirects to :index' do
          post :create
          response.should redirect_to cookies_path
        end
      end

      context 'when save fails' do
        it 'renders new page' do
          cookie.should_receive(:save).and_return(false)
          post :create
          response.should render_template :new
        end
      end
    end


  end

  describe 'member' do
    let(:cookie) {create(:cookie)}
    describe 'DELETE #destroy' do

      it "deletes the cookie" do 
        cookie.reload
        expect{ 
          delete :destroy, id: cookie 
        }.to change{Cookie.count}.by -1
       end 
      it "redirects to cookies#index" do 
        delete :destroy, id: cookie 
        response.should redirect_to cookies_path
      end 

    end
  end
  



end