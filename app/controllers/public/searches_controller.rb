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
    end
  end
end
