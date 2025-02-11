module Messages
  module Organizers
    class Create
      include Interactor::Organizer

      organize(
        ChatRooms::Interactors::Find,
        Messages::Interactors::Create
      )
    end
  end
end
