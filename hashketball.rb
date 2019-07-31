
require 'pry'

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
  points = 0
  game_hash.each do |location, info|
    info[:players].each do |player_name, stats|
      if name == player_name
        points = stats[:points]
      end 
    end
  end 
  points
end

def shoe_size(name)
  game_hash.each do |location, info|
    info[:players].each do |player_name, stats|
      if name == player_name
        return stats[:shoe]
      end 
    end 
  end 
end 

def team_colors(team_name)
  hash = game_hash
  hash.each do |location, info|
    if hash[location][:team_name] == team_name
      info.each do |attribute, data|
        if attribute == :colors
          return hash[location][:colors]
        end 
      end
    end 
  end 
end 
        
def team_names
  hash = game_hash
  array = []
  hash.each do |location, info|
    info.each do |attribute, data|
      if attribute == :team_name
        array << data
      end
    end 
  end
  return array
end 

def player_numbers(team_name)
  hash = game_hash
  array = []
  hash.each do |location, info|
    if hash[location][:team_name] == team_name
      info.each do |attribute, data|
        if data.class == Hash
          data.each do |player_stats|
              player_stats.each do |stats|
              if stats.class == Hash
                array << stats[:number]
              end 
            end
          end 
        end 
      end 
    end 
  end 
  return array
end 

def player_stats(player_name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, data|
      if data.class == Hash
        data.each do |player_stats|
          if player_stats.include?(player_name)
            player_stats.each do |stats|
              if stats.class == Hash
                return stats
              end 
            end 
          end 
        end 
      end 
    end 
  end 
end


def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
      if biggest_shoe < stats[:shoe]
        biggest_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end 
    end 
    return rebounds
  end 
end 


def most_points_scored
  most_points = 0
  player_name = ""
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
      if most_points < stats[:points]
        most_points = stats[:points]
        player_name = player
      end 
    end
  end 
  return player_name
end 


def winning_team
  away = 0 
  home = 0
  array = []
  game_hash[:home][:players].each do |player, data|
    data.each do |stat, num|
      if stat == :points
          home += num
      end 
     end 
  end 
  game_hash[:away][:players].each do |player, data|
    data.each do |stat, num|
      if stat == :points 
        away += num 
      end 
    end 
  end 
  if away > home 
    return game_hash[:away][:team_name]
  else 
    return game_hash[:home][:team_name]
  end 
end 


def player_with_longest_name
  player_name = ""
  longest = 0
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
      #binding.pry
      if player.length > longest
      longest = player.length
      player_name = player
      end 
    end
  end 
  return player_name
end

def long_name_steals_a_ton?
  most_steals = 0 
  player_with_most = ""
  game_hash.each do |location, info|
    info[:players].each do |player, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player_with_most = player 
      end 
    end 
  end 
  if player_with_most == player_with_longest_name
    return true
  end 
end 