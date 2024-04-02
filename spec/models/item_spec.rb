require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it ' image、item_name、introduction、category_id、condition_id、delivery_charge_burden_id、prefecture_id、number_of_day_id、priceが存在し、ユーザーと紐付けされていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nicknameが空では登録できない' do
        # @user.nickname = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end



end
