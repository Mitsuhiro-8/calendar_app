require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "コメント作成機能" do

    describe "コメント送信成功（正常系）" do
      before do
        @comment = build(:comment)
      end

      it "textが1文字以上なら登録できる" do
        @comment.text = "a"
        expect(@comment).to be_valid
      end

      it "textが30文字以下なら登録できる" do
        @comment.text = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほ"
        expect(@comment).to be_valid
      end
    end
  
    describe "コメント送信失敗（異常系）" do
      before do
        @comment = build(:comment)
      end
      
      it "textが空の場合は登録できない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end

      it "textが31文字以上の場合は登録できない" do
        @comment.text = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほま"
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textは30文字以内で入力してください")
      end
    end
  end
end
