require 'json'

class Dungeon < ApplicationRecord
  belongs_to :dungeonable, polymorphic: true

  # validate :fix_rooms_json

  serialize :rooms, JSON

  # Room example:
  # {
  #   'name' => '',
  #   'environment' => '',
  #   'creatures' => [
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

  # before_create do
  #   self.name = login.capitalize if name.blank?
  # end

  before_create do
    # puts rooms
    rooms_hash = JSON.load(rooms)
    rooms_hash.each do |room|
      room['name'] = '' unless room.key?('name')
      room['environment'] = '' unless room.key?('environment')
      room['creatures'] = [] unless room.key?('creatures')
      room['items'] = [] unless room.key?('items')
      room['completed'] = false unless room.key?('completed')
      room['notes'] = '' unless room.key?('notes')
    end
    self.rooms = JSON.dump(rooms_hash)

    # errors.add(:base, "Error message")
    # puts 'hello'
  end

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

  # private

  # def volume_limits
  #     if volume > 4000
  #       errors.add(:volume, “cannot be above 400 cubic inches”)
  #     elsif volume < 20
  #       errors.add(:volume, “cannot be below 20 cubic inches”)
  #     end
  #   end
end
