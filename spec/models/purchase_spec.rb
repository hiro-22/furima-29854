require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
  @purchase = FactoryBot.build(:purchase)
  end


  describe '商品購入機能' do
    context '購入処理がうまくいく時' do
      it 'すべての値が正しく入力されていれば購入記録が保存できること' do
        expect(@purchase).to be_valid
      end
      it 'bldgは空でも保存できること' do
        @purchase.bldg = nil
        expect(@purchase).to be_valid
      end
    end

    context '購入処理がうまくいかない時' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.postal_code = '1112222'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture Select")
      end
      it 'phone_numにはハイフンは不要で、10,11桁以内であること' do
        @purchase.phone_num = '00122'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num is invalid")
      end
      it "phone_numが空では登録できないこと" do
        @purchase.phone_num = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num can't be blank", "Phone num is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end