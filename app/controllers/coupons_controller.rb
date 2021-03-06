class CouponsController < ApplicationController

    def index
        @coupons = Coupon.all
    end

    def show
        @coupon = Coupon.find(params[:id])
    end

    def new
        @coupon = Coupon.new
    end

    def create
        # render plain: params[:article].inspect
        # <ActionController::Parameters {"title"=>"My first Blog article",
        # "text"=>"Lets learn rails....and stuff."} permitted: false>

        # @article = Article.new(params[:article])

        @coupon = Coupon.new(coupon_params)

        # Without Model Validation - Use below
        @coupon.save
        redirect_to @coupon

        # With Model Validation - Use below
        # if @coupon.save
        #     redirect_to @coupon
        # else
        #     render 'new'
        # end
        # validates :title, presence: true, length: { minimum: 5 }
        # validates :text, presence: true, length: { minimum: 5 }
        # validates :alias, uniqueness: true
        # validates :title, uniqueness: true
    end

    private
    def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
    end
end
