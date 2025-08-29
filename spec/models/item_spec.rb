require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品登録' do
    context '出品ができる' do
      it '全て入力した場合、出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない（空）' do
      it '画像が空で登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空で登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空で登録できない' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリが空で登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空で登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料が空で登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元住所が空で登録できない' do
        @item.shipping_address_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address can't be blank")
      end
      it '発送日数が空で登録できない' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it '価格が空で登録できない' do
        @item.amount = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount is not a number")
      end
    end

    context '出品できない（数値幅）' do
      it 'カテゴリが1の場合登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が1の場合登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料が1の場合登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元住所が1の場合登録できない' do
        @item.shipping_address_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address can't be blank") 
      end
      it '発送日数が1の場合登録できない' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank") 
      end
      it '価格が300円未満の場合登録できない' do
        @item.amount = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount must be greater than 299") 
      end
      it '価格が100,000円以上の場合登録できない' do
        @item.amount = '10000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount must be less than 10000000") 
      end
    end

    context  '出品できない（その他）' do
      it '価格が文字の場合登録できない' do
        @item.amount = "あいうえお"
        @item.valid?
       expect(@item.errors.full_messages).to include("Amount is not a number")
      end
      it '価格が全角数字の場合登録できない' do
        @item.amount = "１２３４５"
        @item.valid?
       expect(@item.errors.full_messages).to include("Amount is not a number")
      end
    end
  end
end
