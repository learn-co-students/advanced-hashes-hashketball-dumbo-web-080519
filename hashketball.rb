require "pry"

# build a hash with team data
def game_hash
  game_data = {}
  game_data[:home] = {}
  game_data[:away] = {}

  game_data[:home][:team_name] = "Brooklyn Nets"
  game_data[:home][:colors] = ["Black", "White"]
  game_data[:home][:players] = [ {
    player_name: "Alan Anderson",
    number: 0,
    shoe: 16,
    points: 22,
    rebounds: 12,
    assists: 12,
    steals: 3,
    blocks: 1,
    slam_dunks: 1
    }, {
    player_name: "Reggie Evans",
    number: 30,
    shoe: 14,
    points: 12,
    rebounds: 12,
    assists: 12,
    steals: 12,
    blocks: 12,
    slam_dunks: 7
    }, {
    player_name: "Brook Lopez",
    number: 11,
    shoe: 17,
    points: 17,
    rebounds: 19,
    assists: 10,
    steals: 3,
    blocks: 1,
    slam_dunks: 15
    }, {
    player_name: "Mason Plumlee",
    number: 1,
    shoe: 19,
    points: 26,
    rebounds: 11,
    assists: 6,
    steals: 3,
    blocks: 8,
    slam_dunks: 5
    }, {
    player_name: "Jason Terry",
    number: 31,
    shoe: 15,
    points: 19,
    rebounds: 2,
    assists: 2,
    steals: 4,
    blocks: 11,
    slam_dunks: 1
    } ]

  game_data[:away][:team_name] = "Charlotte Hornets"
  game_data[:away][:colors] = ["Turquoise", "Purple"]
  game_data[:away][:players] = [ {
    player_name: "Jeff Adrien",
    number: 4,
    shoe: 18,
    points: 10,
    rebounds: 1,
    assists: 1,
    steals: 2,
    blocks: 7,
    slam_dunks: 2
    }, {
    player_name: "Bismack Biyombo",
    number: 0,
    shoe: 16,
    points: 12,
    rebounds: 4,
    assists: 7,
    steals: 22,
    blocks: 15,
    slam_dunks: 10
    }, {
    player_name: "DeSagna Diop",
    number: 2,
    shoe: 14,
    points: 24,
    rebounds: 12,
    assists: 12,
    steals: 4,
    blocks: 5,
    slam_dunks: 5
    }, {
    player_name: "Ben Gordon",
    number: 8,
    shoe: 15,
    points: 33,
    rebounds: 3,
    assists: 2,
    steals: 1,
    blocks: 1,
    slam_dunks: 0
    }, {
    player_name: "Kemba Walker",
    number: 33,
    shoe: 15,
    points: 6,
    rebounds: 12,
    assists: 12,
    steals: 7,
    blocks: 5,
    slam_dunks: 12
    } ]

  game_data

end

# return the number of points scored by a given player
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:player_name] == player
        return player_hash[:points]
      end
    end
  end
end

# return the shoe_size scored by a given player
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:player_name] == player
        return player_hash[:shoe]
      end
    end
  end
end

# return the colors of a given team
def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

# return the team names
def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams.push team_data[:team_name]
  end
  teams
end

# returns the jersey numbers of a given team
def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player_hash|
        numbers.push(player_hash[:number])
      end
    end
  end
  numbers
end

# return all the stats for a given player
def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:player_name] == player
        player_hash.delete(:player_name)
        return player_hash
      end
    end
  end
end

# return the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  biggest_shoe_rebounds = nil
  biggest_shoe_size = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if !biggest_shoe_rebounds || (player_hash[:shoe] > biggest_shoe_size)
        biggest_shoe_rebounds = player_hash[:rebounds]
        biggest_shoe_size = player_hash[:shoe]
      end
    end
  end

  biggest_shoe_rebounds
end

# return the name of the player with the most points scored
def most_points_scored
  most_points_number = nil
  most_points_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if !most_points_name || (player_hash[:points] > most_points_number)
        most_points_name = player_hash[:player_name]
        most_points_number = player_hash[:points]
      end
    end
  end

  most_points_name
end

# return the name of the winning team
def winning_team
  home_team_points = 0
  away_team_points = 0

  game_hash.each do |location, team_data|
    points = 0
    team_data[:players].each do |player_hash|
      points += player_hash[:points]
    end
    location == :home ? home_team_points = points : away_team_points = points
  end

  home_team_points > away_team_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

# return the longest player name
def player_with_longest_name
  longest_name = nil
  longest_name_length = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if !longest_name || (player_hash[:player_name].length > longest_name_length)
        longest_name = player_hash[:player_name]
        longest_name_length = longest_name.length
      end
    end
  end

  longest_name
end

# check if the player with the longest name had the most steals
def long_name_steals_a_ton?
  most_steals_number = nil
  most_steals_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if !most_steals_name or (player_hash[:steals] > most_steals_number)
        most_steals_name = player_hash[:player_name]
        most_steals_number = player_hash[:steals]
      end
    end
  end

  most_steals_name == player_with_longest_name ? true : false
end
