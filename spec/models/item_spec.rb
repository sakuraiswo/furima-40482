require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it ' image、item_name、introduction、category_id、condition_id、delivery_charge_burden_id、prefecture_id、number_of_day_id、priceが存在し、userと紐付けされていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_charge_burden_idが空では登録できない' do
        @item.delivery_charge_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'number_of_day_idが空では登録できない' do
        @item.number_of_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userと紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'item_nameが41字以上では登録できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'introductionが1001字以上では登録できない' do
        @item.introduction = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Introduction is too long (maximum is 1000 characters)')
      end
      it 'priceが300未満では登録できない' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999 and consist of digits only')
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = Faker::Number.between(from: 10_000_000, to: 99_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999 and consist of digits only')
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999 and consist of digits only')
      end
      it 'priceが半角でも英字では登録できない' do
        @item.price = 'twothousand'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between ¥300 and ¥9,999,999 and consist of digits only')
      end
    end
  end
end
