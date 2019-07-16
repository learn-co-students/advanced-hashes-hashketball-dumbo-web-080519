require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          "Alan Anderson" => {:number => 0,
                              :shoe => 16,
                              :points => 22,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 1}
        },
        {
          "Reggie Evans" => {:number => 30,
                             :shoe => 14,
                             :points => 12,
                             :rebounds => 12,
                             :assists => 12,
                             :steals => 12,
                             :blocks => 12,
                             :slam_dunks => 7}
        },
        {
          "Brook Lopez" => {:number => 11,
                            :shoe => 17,
                            :points => 17,
                            :rebounds => 19,
                            :assists => 10,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 15}
        },
        {
          "Mason Plumlee" => {:number => 1,
                              :shoe => 19,
                              :points => 26,
                              :rebounds => 11,
                              :assists => 6,
                              :steals => 3,
                              :blocks => 8,
                              :slam_dunks => 5}
        },
        {
          "Jason Terry" => {:number => 31,
                            :shoe => 15,
                            :points => 19,
                            :rebounds => 2,
                            :assists => 2,
                            :steals => 4,
                            :blocks => 11,
                            :slam_dunks => 1}
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          "Jeff Adrien" => {:number => 4,
                            :shoe => 18,
                            :points => 10,
                            :rebounds => 1,
                            :assists => 1,
                            :steals => 2,
                            :blocks => 7,
                            :slam_dunks => 2}
        },
        {
          "Bismack Biyombo" => {:number => 0,
                                :shoe => 16,
                                :points => 12,
                                :rebounds => 4,
                                :assists => 7,
                                :steals => 22,
                                :blocks => 15,
                                :slam_dunks => 10}
        },
        {
          "DeSagna Diop" => {:number => 2,
                             :shoe => 14,
                             :points => 24,
                             :rebounds => 12,
                             :assists => 12,
                             :steals => 4,
                             :blocks => 5,
                             :slam_dunks => 5}
        },
        {
          "Ben Gordon" => {:number => 8,
                           :shoe => 15,
                           :points => 33,
                           :rebounds => 3,
                           :assists => 2,
                           :steals => 1,
                           :blocks => 1,
                           :slam_dunks => 0}
        },
        {
          "Kemba Walker" => {:number => 33,
                             :shoe => 15,
                             :points => 6,
                             :rebounds => 12,
                             :assists => 12,
                             :steals => 7,
                             :blocks => 5,
                             :slam_dunks => 12}
        }]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if player_name == specific_name
          return specific_stats[:points]
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if player_name == specific_name
          return specific_stats[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player_stats|
        player_stats.each do |specific_name, specific_stats|
          player_numbers << specific_stats[:number]
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if player_name == specific_name
          return specific_stats
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  big_foot_rebound = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if specific_stats[:shoe] > shoe_size
          shoe_size = specific_stats[:shoe]
          big_foot_rebound = specific_stats[:rebounds]
        end
      end
    end
  end
  big_foot_rebound
end

def most_points_scored
  points_scored = 0
  scorer = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if specific_stats[:points] > points_scored
          points_scored = specific_stats[:points]
          scorer = specific_name  
        end
      end
    end
  end
  scorer
end

def winning_team
  home_score = 0
  away_score = 0
  winning_team = ""
  game_hash.each do |location, team_data|
    #binding.pry
    if location == :home
      team_data[:players].each do |player_stats|
        player_stats.each do |specific_name, specific_stats|
          home_score += specific_stats[:points]
        end
      end
    elsif location == :away
      team_data[:players].each do |player_stats|
        player_stats.each do |specific_name, specific_stats|
          away_score += specific_stats[:points]
        end
      end
    end
    if home_score > away_score
      return game_hash[:home][:team_name]
    elsif away_score > home_score
      return game_hash[:away][:team_name]
    else
      puts "Tie Game" # Just added this for the hell of it .
    end
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if specific_name.length > longest_name.length
          longest_name = specific_name
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = ""
  steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats|
      player_stats.each do |specific_name, specific_stats|
        if specific_name.length > longest_name.length
          longest_name = specific_name
        end
        if specific_stats[:steals] > steals
          steals = specific_stats[:steals]
        end
        if team_data[:players][0][longest_name][:steals] == steals
          return true
        else
          return false
        end
      end
    end
  end
end
