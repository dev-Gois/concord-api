module ChatRooms
  module Organizers
    class Create
      include Interactor::Organizer

      organize(
        ChatRooms::Interactors::Create,
        ChatRooms::Interactors::AddMembers
      )
    end
  end
end
