class Dungeon < ApplicationRecord
  belongs_to :dungeonable, polymorphic: true

  serialize :rooms, JSON

  # rooms have:
  #   name
  #   description
  #   enemies
  #     name
  #     count
  #   items
  #     name
  #     count
  #   completed
  #   notes

  # Room example:
  # {
  #   'name' => '',
  #   'environment' => '',
  #   'enemies' => [
  #     {
  #       'name' => '',
  #       'count' => 
  #     }
  #   ],
  #   'items' => [
  #     {
  #       'name' => '',
  #       'count' => 
  #     }
  #   ],
  #   'completed' => false
  #   'notes' => ''
  # }

  def help_text
    @help_text = <<~HEREDOC
      Natural dungeons such as caves
      * **Tunnel** = Room leads to one more room. (Open line of sight to corner of tunnel)
      * **Dead end** = Room does not lead to more rooms.
      * **Cliff** = Room leads to one more room but players have to climb up.  Height of the cliff is described in details of the room.

      Indoors such as warehouse
      * **Doorway** = Room leads to one more room. (Open line of sight to room)
      * **Door** = Room leads to one more room. (Door, blocks line of sight)
      * **Two doors** = Room leads to two more rooms.
      * **Window** = Room has window. Height of bottom edge of the window is described in details of the room.

      **Example:** Second room of the dungeon has two doors. First door leads to third room. Second door leads to fourth room.
    HEREDOC
  end
end
