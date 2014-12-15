class MypagesController < ApplicationController
  before_action :set_mypage, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  end

  def show
    respond_with(@mypage)
  end

  def new
    @mypage = Mypage.new
    respond_with(@mypage)
  end

  def edit
  end

  def create
    @mypage = Mypage.new(mypage_params)
    @mypage.save
    respond_with(@mypage)
  end

  def update
    @mypage.update(mypage_params)
    respond_with(@mypage)
  end

  def destroy
    @mypage.destroy
    respond_with(@mypage)
  end

  private
    def set_mypage
      @mypage = Mypage.find(params[:id])
    end

    def mypage_params
      params[:mypage]
    end
end
