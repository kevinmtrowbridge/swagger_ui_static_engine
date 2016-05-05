module SwaggerUiStaticEngine
  class EngineController < ActionController::Base
    def index
      @swagger_url = SwaggerUiStaticEngine::Engine.swagger_url
    end
  end
end