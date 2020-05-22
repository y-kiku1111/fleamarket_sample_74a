# require 'rails_helper'
# describe CardsController, type: :controller do
#   # createの場合はテスト用のDBに値が保存されます
#   let(:user) { create(:user) }
#   let(:card) { create(:card, user_id: user.id) }
#   describe 'GET #show' do
#       context 'ログイン時' do
#       before do
#         login user
#       end
#       it "showアクションのページに遷移するか" do
#         allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
#         product = create(:product)
#         get :show, params: { id: product,card: card}
#         expect(response).to render_template :show
#       end
#     end
#   end
# end