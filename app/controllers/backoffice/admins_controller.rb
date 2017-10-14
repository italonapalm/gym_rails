class AdminController < BackofficeController
  def index
    @admins = Admin.all
  end
end
