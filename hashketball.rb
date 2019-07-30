require "pry"
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
          "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          "Brook Lopez" => {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15,
          },
          "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          "Jason Terry" => {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          },
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2,
          },
          "Bismack Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks:10,
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5,
          },
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          "Kemba Walker" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          },
        }
      ]
    }
  }

  return game_hash
end

def num_points_scored(name)
  points = 0
  game_hash.each do | location, team_data |
    team_data[:players].each do | attribute |
      if attribute[name]
        points += attribute[name][:points]
      else
        game_hash[:away] do | location, team_data |
          team_data[:players].each do | attribute |
            points += attribute[name][:points]
          end
        end
      end
    end
  end
  return points
end

def shoe_size(name)
  shoe_size = 0
  game_hash.each do | location, team_data |
    team_data[:players].each do | attribute |
      if attribute[name]
        shoe_size += attribute[name][:shoe]
      else
        game_hash[:away] do | location, team_data |
          team_data[:players].each do | attribute |
            shoe_size += attribute[name][:shoe]
          end
        end
      end
    end
  end
  return shoe_size
end

def team_colors(team)
  game_hash.each do | location, team_data |
    if team_data[:team_name] == team
      return team_data[:colors]
    else
      game_hash[:away] do | location, team_data |
        return team_data[:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do | location, team_data |
    teams << team_data[:team_name]
  end

  game_hash[:away] do | location, team_data |
      teams << team_data[:team_name]
  end

  return teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do | location, team_data |
    if team_data[:team_name] == team
        team_data[:players].each do | players |
            players.each do | name, data|
              numbers << data[:number]
            end
        end
    else
      game_hash[:away] do | location, team_data |
        eam_data[:players].each do | attribute |
          players.each do | name, data|
            numbers << data[:number]
          end
        end
      end
    end
  end

  return numbers
end

def player_stats(name)
  game_hash.each do | location, team_data |
    team_data[:players].each do | attribute |
      if attribute[name]
        return attribute[name]
      else
        game_hash[:away] do | location, team_data |
          team_data[:players].each do | attribute |
            return attribute[name]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = nil
  game_hash.each do | location, team_data |
    team_data[:players].each do | players |
      players.each do | name, data|
        if big_shoe == 0
          big_shoe = data[:shoe]
          big_player = name
          rebounds = data[:rebounds]
        elsif data[:shoe] > big_shoe
          big_shoe = data[:shoe]
          big_player = name
          rebounds = data[:rebounds]
        end
      end
    end
  end
  rebounds
end
