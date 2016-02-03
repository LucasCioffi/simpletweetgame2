module ProcessTweet
  @queue = :tweet

  def self.perform(status)
    status_user = status['user']
    twitter_user_id = status_user['screen_name']
    user = User.find_by_twitter_user_id(twitter_user_id)

    user = init_new_user(status) unless user
    board = Board.first
    participation_record = find_most_recent_participation_record(user, board)

    unless participation_record
      participation_record = user.local_participation_records.create!(board: board, xpos: board.width / 2, ypos: board.height / 2, num_moves: 0, num_invites: 0)
    end

    process_turn(user, participation_record, status)
  end

  private

  def self.init_new_user(status)
    create_service = CreateUserService.new(status)
    create_service.execute
  end

  def self.find_most_recent_participation_record(user, board = nil)
    user.local_participation_records.where('updated_at > ?', Time.now - 2.hours).
        where(board: board || Board.find(0)).
        order('updated_at DESC').first
  end

  def self.process_turn(user, participation_record, status)
    msg = status['text'].strip
    turn = Turn.create(user: user, board: participation_record.board, local_participation_record: participation_record, message: msg)
    turn.parse_command!
  end
end
