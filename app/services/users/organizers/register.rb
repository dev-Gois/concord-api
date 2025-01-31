module Users
  module Organizers
    class Register
      include Interactor::Organizer

      organize(
        Users::Interactors::ValidateParams,
        Users::Interactors::Register
      )
    end
  end
end
