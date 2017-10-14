class Backoffice::AdminsController < BackofficeController
  def index
    @admin = Admin.new
    @admins = Admin.actives
  end
end
