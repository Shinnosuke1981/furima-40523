require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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

      it 'emailが重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'last_name_kanjiが英語だと登録できない' do
        @user.last_name_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
      end

      it 'first_name_kanjiが英語だと登録できない' do
        @user.first_name_kanji = 'takeshi'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
      end

      it 'last_name_kanjiが数字だと登録できない' do
        @user.last_name_kanji = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
      end

      it 'first_name_kanjiが数字だと登録できない' do
        @user.first_name_kanji = '４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
      end

      it 'last_name_katakanaが英語だと登録できない' do
        @user.last_name_katakana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana 全角カタカナを使用してください')
      end

      it 'first_name_katakanaが英語だと登録できない' do
        @user.first_name_katakana = 'takeshi'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナを使用してください')
      end

      it 'last_name_katakanaが漢字だと登録できない' do
        @user.last_name_katakana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana 全角カタカナを使用してください')
      end

      it 'first_name_katakanaが漢字だと登録できない' do
        @user.first_name_katakana = '武'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナを使用してください')
      end

      it 'last_name_katakanaが数字だと登録できない' do
        @user.last_name_katakana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana 全角カタカナを使用してください')
      end

      it 'first_name_katakanaが数字だと登録できない' do
        @user.first_name_katakana = '456'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナを使用してください')
      end

      it 'passwordは、半角英字のみでは登録できないこと' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を使用してください')
      end

      it 'passwordは、半角数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を使用してください')
      end

      it 'passwordは、全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｃabc456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を使用してください')
      end
    end
  end
end
