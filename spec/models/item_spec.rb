require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image.purge
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '販売価格が空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '販売価格が英語だと登録できない' do
        @item.item_price = 'yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格が漢字だと登録できない' do
        @item.item_price = '千円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格がひらがなだと登録できない' do
        @item.item_price = 'せんえん'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格がカタカナだと登録できない' do
        @item.item_price = 'センエン'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格が全角数字だと登録できない' do
        @item.item_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '販売価格が300以上でないと登録できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it '販売価格が9999999以下でないと登録できない' do
        @item.item_price = '1000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end

      it '配送料の負担が空では登録できない' do
        @item.shipping_fee_responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
      end

      it 'commentが空では登録できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it 'item_category_idが1では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it 'shipping_origin_idが1では登録できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it 'estimated_shipping_date_idが1では登録できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
