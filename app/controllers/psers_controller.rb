class PsersController < ApplicationController


    def new
        @pser = Pser.new
    end

    def create
        @pser = Pser.new(pser_params)

        if @pser.save
            redirect_to show_qrcode_pser_path(@pser), notice: 'Usuario foi criado com sucesso'
        else
            flash.now[:alert] = 'Erro ao criar o usuário'
        end
    end

    def show_qrcode 
        @pser = Pser.find(params[:id])
        qr_data = @pser.id

        @api = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=#{qr_data}"

    end

    private
    def pser_params
        params.require(:pser).permit(:name, :email, :senha)
    end
    
end



