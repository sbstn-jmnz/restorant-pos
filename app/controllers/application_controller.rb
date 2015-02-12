class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  #Esto es para setear el titulo de cada pagina basado en el nombre del controlador que se
  #esta ejecutando
  before_filter :do_common_stuff
  def do_common_stuff
    @controllerName = self.class.name.sub("Controller", "").singularize
    @acctionName = params["action"].to_s
  end

  #Where to go after sign in
  def after_sign_in_path_for(user)
    ingredients_path
  end
  #Where to go after sign out
  def after_sign_out_path_for(user)
    #Revisar, debe haber una mejor forma de redireccionar al formulario de ingreso
    ingredients_path
  end


end
