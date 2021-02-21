require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,birthday,first_name,surname_name,katakana_first_name,katakana_surname_nameが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "s000000"
        @user.password_confirmation = "s000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がなければ登録できない" do
        @user.email = "5516shugmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが全角文字では登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password_confirmation = "000000s"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英数字混合での入力でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "surname_nameが空では登録できない" do
        @user.surname_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname name can't be blank")
      end
      it "katakana_first_nameが空では登録できない" do
        @user.katakana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      it "katakana_surname_nameが空では登録できない" do
        @user.katakana_surname_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana surname name can't be blank")
      end
      it "first_nameは漢字、平仮名でないと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "surname_nameは漢字、平仮名でないと登録できない" do
        @user.surname_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname name Full-width characters")
      end
      it "katakana_first_nameはカタカナでないと登録できない" do
        @user.katakana_first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name Full-width katakana characters")
      end
      it "katakana_surname_nameはカタカナでないと登録できない" do
        @user.katakana_surname_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana surname name Full-width katakana characters")
      end
      it "katakana_first_nameはカタカナ以外の全角文字では登録できない" do
        @user.katakana_first_name = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name Full-width katakana characters")
      end
      it "katakana_surname_nameはカタカナ以外の全角文字では登録できない" do
        @user.katakana_surname_name = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana surname name Full-width katakana characters")
      end
    end
  end
end
