require "pry"
def game_hash
   game_hash ={:home =>
    { :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
        },
        {:player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
        },
        {:player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
        }
      ]
    },
     :away =>
     { :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
         {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
        }
      ]
    }
   }
 end

def find_player(name)
   players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.find{ |player| player[:player_name] == name }
end

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  find_player(name)[:shoe]
end

def teams
  game_hash.keys.reduce([]){ |keysha, k|  keysha << game_hash[k] }
end

def all_players
  teams.reduce([]){ |keysha, t|  keysha<< t[:players] }.flatten
end

def find_team_by_name(team_name)
  teams.find{ |t| t[:team_name] == team_name }
end

def team_colors(team_name)
  find_team_by_name(team_name)[:colors]
end

def team_names
  teams.map{ |t| t[:team_name] }
end

def player_numbers(tn)
  find_team_by_name(tn)[:players].reduce([]) do |memo, pl|
    memo << pl[:number]
    memo
  end
end

def player_stats(name)
  player_found = find_player(name)
  player_found.shift
  return player_found
end

def big_shoe_rebounds
  all_players.max_by{ |player| player[:shoe] }[:rebounds]
end