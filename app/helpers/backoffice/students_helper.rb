module Backoffice::StudentsHelper
  OptionsForSex = Struct.new(:id, :description)

  def options_for_sex
    options = []
    options.push(OptionsForSex.new('M', 'Masculino'))
    options.push(OptionsForSex.new('F', 'Feminino'))
    options
  end
end
