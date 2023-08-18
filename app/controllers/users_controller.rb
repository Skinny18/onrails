class UsersController < ApplicationController
    before_action :find_user, only: [:qrcode]
    
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to qrcode_user_path(@user), notice: 'Usuário foi criado com sucesso'
      else
        flash.now[:alert] = 'Erro ao criar o usuário'
        render 'new'
      end
    end
  
    def qrcode
      qr_data = @user.id
      @api = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=#{qr_data}"
    end
  
    def login
      user = User.find_by(email: params[:user][:email])
      Rails.logger.debug("Params: #{params.inspect}") # Adicione esta linha para registrar os parâmetros

      if user&.authenticate(params[:user][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'E-mail ou senha inválidos'
        render 'new'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :senha)
    end
  
    def find_user
      @user = User.find(params[:id])
    end
  end
  