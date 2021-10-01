require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品情報登録' do
    context '出品情報登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end

      context '出品情報登録ができないとき' do
        it '商品画像が空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空だと登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空だと登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーの情報が「---」だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'カテゴリーの情報が空だと登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
        end
        it '商品の状態の情報が「---」だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '商品の状態の情報が空だと登録できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank", "Status can't be blank")
        end
        it '配送料の負担の情報が「---」だと登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end
        it '配送料の負担の情報が空だと登録できない' do
          @item.delivery_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge can't be blank")
        end
        it '発送元の地域の情報が「---」だと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送元の地域の情報が空だと登録できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
        end
        it '発送までの日数の情報が「---」だと登録できない' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank")
        end
        it '発送までの日数の情報が空だと登録できない' do
          @item.delivery_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day can't be blank")
        end
        it '価格が空だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
        end
        it '価格の範囲が、300円未満だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '価格の範囲が、9,999,999円を超えると登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        
        it '価格に半角数字以外が含まれている場合登録できない' do
          @item.price = '12a34'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end
