class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to qrcode_user_path(@user), notice: 'Usuario foi criado com sucesso'
        else
            flash.now[:alert] = 'Erro ao criar o usuário'
        end
    end

    def qrcode 
        @user = User.find(params[:id])
        qr_data = @user.id

        @api = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=#{qr_data}"
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :senha)
    end
    
end
