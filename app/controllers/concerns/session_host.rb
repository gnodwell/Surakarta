class SessionHost < ActionController
  def new
    @session = Session.new()
  end

end