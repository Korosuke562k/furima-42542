require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe '商品購入機能' do
    context '購入ができる' do
      it '全て入力済の場合購入ができる' do
        expect(@buy_address).to be_valid
      end
      it '建物は空白でも入力ができる' do
        @buy_address.building_name = ""
        expect(@buy_address).to be_valid
      end
    end


    context '購入できない' do
      it 'トークンが空白の場合登録できない' do
        @buy_address.token = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空白の場合登録できない' do
        @buy_address.post_code = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがない場合登録できない' do
        @buy_address.post_code = "1234567"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is valid. Include hyphen(-)")
      end
      it '郵便番号が全角の場合登録できない' do
        @buy_address.post_code = "１２３ー４５６７"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code is valid. Include hyphen(-)")
      end
      it '都道府県が空白の場合登録できない' do
        @buy_address.shipping_address_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '都道府県が1の場合登録できない' do
        @buy_address.shipping_address_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '市町村が空白の場合登録できない' do
        @buy_address.city = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空白の場合登録できない' do
        @buy_address.street = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空白の場合登録できない' do
        @buy_address.telephone = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号にハイフンがある場合登録できない' do
        @buy_address.telephone = "080-1111-1111"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone  must be 10 or 11 digit Half-width numbers")
      end
      it '電話番号が9桁以下の場合入力できない' do
        @buy_address.telephone = "080123456"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone  must be 10 or 11 digit Half-width numbers")
      end
      it '電話番号が12桁以上の場合入力できない' do
        @buy_address.telephone = "080123456789"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone  must be 10 or 11 digit Half-width numbers")
      end
      it 'ユーザーIDが空白の場合登録できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品IDが空白の場合登録できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
