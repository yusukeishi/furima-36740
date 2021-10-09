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
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        it '商品名が空だと登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        it '商品の説明が空だと登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("テキストを入力してください")
        end
        it 'カテゴリーの情報が「---」だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリー入力してください")
        end
        it 'カテゴリーの情報が空だと登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリー入力してください")
        end
        it '商品の状態の情報が「---」だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態入力してください")
        end
        it '商品の状態の情報が空だと登録できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態を入力してください")
        end
        it '配送料の負担の情報が「---」だと登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担入力してください")
        end
        it '配送料の負担の情報が空だと登録できない' do
          @item.delivery_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
        end
        it '発送元の地域の情報が「---」だと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送元の地域入力してください")
        end
        it '発送元の地域の情報が空だと登録できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
        end
        it '発送までの日数の情報が「---」だと登録できない' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("配送までの日数入力してください")
        end
        it '発送までの日数の情報が空だと登録できない' do
          @item.delivery_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
        end
        it '価格が空だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
        end
        it '価格の範囲が、300円未満だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
        end
        it '価格の範囲が、9,999,999円を超えると登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
        end
        it '価格に半角数字以外が含まれている場合登録できない' do
          @item.price = '12a34'
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は数値で入力してください')
        end
        it 'ユーザー登録している人でないと出品できない' do
          @item.user_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Userを入力してください')
        end
      end
    end
  end
end
