require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(0.3)
  end

  describe '商品購入' do
    context '商品を購入できる場合' do
      it 'post_code, prefecture_id, city, street_address, building, phone_number, tokenがあり、user, itemと紐付いていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと購入できない' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Token error. Card has incorrect information')
      end
      it 'userと紐付いていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐付いていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeにハイフンが無いと購入できない' do
        @purchase_address.post_code = '0000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code must be in the format 123-4567.')
      end
      it 'post_codeに000-0000の形式と違うと購入できない' do
        @purchase_address.post_code = '0000-000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code must be in the format 123-4567.')
      end
      it 'post_codeが全角数字だと購入できない' do
        @purchase_address.post_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code must be in the format 123-4567.')
      end
      it 'post_codeが英字では購入できない' do
        @purchase_address.post_code = 'aaa-aaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code must be in the format 123-4567.')
      end
      it 'phone_numberが全角だと購入できない' do
        @purchase_address.phone_number = '１２３４５６７８９１０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number must contain only half-width numbers.')
      end
      it 'phone_numberが半角でも英字だと購入できない' do
        @purchase_address.phone_number = 'abcdefghijk'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number must contain only half-width numbers.')
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number must contain only half-width numbers.')
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number must contain only half-width numbers.')
      end
      it 'phone_numberがハイフンがあると購入できない' do
        @purchase_address.phone_number = '123-45678-9012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number must contain only half-width numbers.')
      end
    end
  end
  
end
