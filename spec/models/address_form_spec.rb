require 'rails_helper'

RSpec.describe AddressForm, type: :model do
  describe '商品購入機能の確認' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_form = FactoryBot.build(:address_form,item_id:item.id,user_id:user.id)
      sleep 0.1 # 0.1秒待機
    end

  context '商品登録がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_form).to be_valid
    end

    it '建物名が抜けていても登録できること' do
      @address_form.building_name = ""
      expect(@address_form).to be_valid
    end
  end

  context '商品登録がうまくいかないとき' do
    it '都道府県を選択しないと保存できないこと' do
      @address_form.area_id = 1
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Area must be other than 1")
    end
    it '電話番号を入力しないと保存できないこと' do
      @address_form.phone_number = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が半角でないと保存できないこと' do
      @address_form.phone_number = "０９０１２３４５６７８"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
    end
    it '電話番号が12桁以上では保存できないこと' do
      @address_form.phone_number = "090123456789"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
    end
    it '電話番号が日本語では保存できないこと' do
      @address_form.phone_number = "あ"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
    end
    it '市区町村を入力しないと保存できないこと' do
      @address_form.municipality = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it '市区町村は全角日本語で入力しないと保存できないこと' do
      @address_form.municipality = "ﾖｺﾊﾏｼ"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
    end
    it '郵便番号を入力しないと保存できないこと' do
      @address_form.postal_code = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_form.postal_code = "1234567"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '番地を入力しないと保存できないこと' do
      @address_form.address_number = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Address number can't be blank")
    end
    it 'トークンが空では保存できないこと' do
      @address_form.token = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では保存できないこと' do
      @address_form.user_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では保存できないこと' do
      @address_form.item_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Item can't be blank")
    end
    end
  end
end
