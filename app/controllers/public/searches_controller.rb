class Public::SearchesController < ApplicationController

  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == "tag"
      if method == "perfect"
        Tag.where(name: content)
      elsif method == "forward"
        @tag = Tag.where("name LIKE?", content+'%')
      elsif method == "backward"
        @tag = Tag.where("name LIKE?", '%'+content)
      else
        Tag.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == "question"
      if method == "perfect"
        Question.where(title: content)
      elsif method == "forward"
        @question = Question.where("title LIKE?", content+'%')
      elsif method == "backward"
        @question = Question.where("title LIKE?", '%'+content)
      else
        Question.where('title LIKE ?', '%'+content+'%')
      end
    elsif model == "member"
      if method == "perfect"
        Member.where(name: content)
      elsif method == "forward"
        @member = Member.where("name LIKE?", content+'%')
      elsif method == "backward"
        @member = Member.where("name LIKE?", '%'+content)
      else
        Member.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end
