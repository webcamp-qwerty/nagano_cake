class Admin::SearchsController < Admin::ApplicationController

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @name = params["search"]["name"]
    @datas = search_for(@how, @value)
  end

private

  def match(value)
      Customer.where_sql(last_name: value)
      #concat?
      #||で区切る
  end

  def forward(value)
      Customer.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
      Customer.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
      Customer.where("name LIKE ?", "%#{value}%")
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

end
