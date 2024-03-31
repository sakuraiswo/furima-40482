require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it ' nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers.')
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers.')
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'ﾐｮｳジ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name must consist of full-width characters only.')
      end
      it 'last_nameが全角でも英字では登録できない' do
        @user.last_name = 'Ｎａｍｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name must consist of full-width characters only.')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name must consist of full-width characters only.')
      end
      it 'first_nameが全角でも英字では登録できない' do
        @user.first_name = 'Ｎａｍｅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name must consist of full-width characters only.')
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'ﾐｮｳｼﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana must consist of full-width Katakana characters only.')
      end
      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana must consist of full-width Katakana characters only.')
      end
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana must consist of full-width Katakana characters only.')
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana must consist of full-width Katakana characters only.')
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana must consist of full-width Katakana characters only.')
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana must consist of full-width Katakana characters only.')
      end
    end
  end
end
