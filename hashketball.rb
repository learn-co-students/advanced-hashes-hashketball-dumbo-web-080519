require "pry"
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end


def num_points_scored(name)
  points = nil
  game_hash.each do |teams, info| #teams = home,away , info = inside hash
    info[:players].each do |player,attributes|
      if name == player
        points = attributes[:points]
      end
    end
  end
  return points
end

def shoe_size(name)
  shoe = nil
  game_hash.each do |teams,info|
    info[:players].each do |player,attributes|
      if name == player
        shoe = attributes[:shoe]
      end
    end
  end
  return shoe
end

def team_colors(name)
  game_hash.each do |teams,info|
    if name == info[:team_name]
     return info[:colors]
     binding.pry
   end
  end
end

def team_names
  new_arr =[]
  game_hash.each do |teams,info|
     new_arr.push(info[:team_name])
  end
  new_arr
end

def player_numbers(team_name)
  team_num = []
  game_hash.each do |teams,info|
    if team_name == info[:team_name]
      info[:players].each do |name|
        team_num.push(name[1][:number])
      end
    end
  end
  team_num
end

def player_stats(name)
  game_hash.each do |teams, info|
   info[:players].each do |player_name, player_data|
     if player_name == name
       return player_data
     end
   end
 end
end

def big_shoe_rebounds
  shoe_size = 0
  game_hash.each do |teams, info|
    info[:players].each do |player,attributes|
      if attributes[:shoe] > shoe_size
        shoe_size = attributes[:shoe]
      end
    end
  end
  game_hash.each do |teams,info|
    info[:players].each do |player,attributes|
      if shoe_size == attributes[:shoe]
        return attributes[:rebounds]
      end
    end
  end
end
