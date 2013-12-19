class HomeController < ApplicationController
  def index
    @mocks = Mock.all
  end
end
