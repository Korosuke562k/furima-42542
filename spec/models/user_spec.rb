require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる' do
      it '全て入力した場合、ユーザー登録ができる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない（空）' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '苗字が空では登録できない' do
        @user.myoji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Myoji can't be blank")
      end
      it '名が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it '苗字（カナ）が空では登録できない' do
        @user.myoji_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Myoji kana can't be blank")
      end
      it '名（カナ）が空では登録できない' do
        @user.mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    context 'ユーザー登録ができない（その他）' do
      it 'メールアドレスが重複してはいけない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスには@を含む' do
        @user.email = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードはパスワード（確認）と一致する必要あり' do
        @user.password = '123456a'
        @user.password_confirmation = '123456b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは半角英数字混合での入力が必須' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは6文字以上' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '姓は全角での入力が必須' do
        @user.myoji = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Myoji is invalid')
      end
      it '名は全角での入力が必須' do
        @user.name = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid')
      end
      it '性（カナ）はカタカナでの入力が必須' do
        @user.myoji_kana = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Myoji kana is invalid')
      end
      it '名（カナ）はカタカナでの入力が必須' do
        @user.mei_kana = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kana is invalid')
      end
    end
  end
end
