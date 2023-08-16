class PsersController < ApplicationController


    def new
        @pser = Pser.new
    end

    def create
        @pser = Pser.new(pser_params)

        if @pser.save
            redirect_to @pser, notice: 'Usuario foi criado com sucesso'
        else
            render :new
        end
    end

    private
    def pser_params
        params.require(:pser).permit(:name, :email, :senha)
    end
    
end



