require 'rails_helper'

RSpec.describe Item, type: :model do
 describe '出品情報の登録' do
  before do
    # itemのファクトリーの綴りの確認をしましょう
    # userをファクトリーから持ってきましょう
    # :itemの後ろにユーザーのキーバリューを設定しましょう
    # imageを生成しましょう　@item.
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  it '全ての項目が入力されていれば登録できる' do
    expect(@item).to be_valid
  end
  it '画像無しでは登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it '商品名無しでは登録できない' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it '説明文無しでは登録できない' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it 'カテゴリーを選択していないと登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  it '商品の状態を選択していないと登録できない' do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition must be other than 1")
  end
  it '配送料についての情報を選択していないと登録できない' do
    @item.potage_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Potage must be other than 1")
  end
  it '発送元の地域の情報を選択していないと登録できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it '発送までの日数の情報を選択していないと登録できない' do
    @item.delivery_date_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
  end
  it '価格の登録無しでは登録できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
  end
  it '価格が全角だと登録できない' do
    @item.price = '１０００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it '価格が¥299以下では登録できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
  it '価格が¥10,000,000以上では登録できない' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
 end
end