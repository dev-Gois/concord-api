module Users
  module Organizers
    class Register
      include Interactor::Organizer

      organize(
        Users::Interactors::ValidateParams,
        Users::Interactors::Register,
        Users::Interactors::Authorization::EncodeToken
      )
    end
  end
end
