class Public::SearchsController < ApplicationController
  def search
    @model = "Item"
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @value)
  end
  
   private
  
  def match(model, value)
    if model == 'Item'
      Item.where(name: value)
    end
  end
  
  def forward(model, value)
    if model == 'Item'
      Item.where("name LIKE ?", "#{value}%")
    end
  end
  
  def backward(model, value)
    if model == 'Item'
      Item.where("name LIKE ?", "%#{value}")
    end
  end
  
  def partical(model, value)
   if model == 'Item'
      Item.where("name LIKE ?", "%#{value}%")
   end
  end
  
  def search_for(how, model, value)
    case how
    when 'match'
      match(model, value)
    when 'forward'
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end
  end
  
end
