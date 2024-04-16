require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複している場合は登録できない' do
      User.create(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name_kanji: '安倍', first_name_kanji: '晋三', last_name_katakana: 'アベ', first_name_katakana: 'シンゾウ', birth_date: '1954-09-21') 
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name_kanji: '安倍', first_name_kanji: '晋三', last_name_katakana: 'アベ', first_name_katakana: 'シンゾウ', birth_date: '1954-09-21')
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが@を含まない場合は登録できない' do
      user = User.new(nickname: 'test', email: 'testexample', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordが5文字以下では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '123456', password_confirmation: '654321')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'last_name_kanjiが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name_kanji: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    
    it 'first_name_kanjiが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name_kanji: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it 'last_name_katakanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name_katakana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name katakana can't be blank")
    end
    
    it 'first_name_katakanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', first_name_katakana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name katakana can't be blank")
    end
  end
end