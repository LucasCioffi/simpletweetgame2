class Turn < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  belongs_to :local_participation_record

  attr_accessor :command

  def parse_command!
    cmd_name, cmd_args = message.split(/\s/, 2)

    case cmd_name
      when 'go' then move_user(user, local_participation_record, *cmd_args.split(/\s/))
      else invalid_command(cmd_args)
    end

    save!
  end

  private

  def move_user(user, participation_record, *args)
    self.command = 'go'
    newx, newy = [participation_record.xpos, participation_record.ypos]
    cmd_args = args
    if cmd_args.length > 0
      case cmd_args.first.downcase
        when 'up' then
          self.command += ' left'
          newy = newy - 1
        when 'right' then
          self.command += ' right'
          newx = newx + 1
        when 'down' then
          self.command += ' down'
          newy = newy + 1
        when 'left' then
          self.command += ' left'
          newx = newx - 1
      end
    end

    # reset if out of bounds
    newx = participation_record.xpos if newx < 0 or newx >= self.board.width
    newy = participation_record.ypos if newy < 0 or newy >= self.board.height
    self.xpos = newx
    self.ypos = newy
    participation_record.update!(xpos:newx, ypos:newy, num_moves: participation_record.num_moves + 1)
  end

  def invalid_command(*args)
    self.command = 'invalid'
  end
end
