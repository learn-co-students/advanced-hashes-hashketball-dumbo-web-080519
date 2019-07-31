require 'pry'

def game_hash
  { :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players =>
      [{
        "Alan Anderson" => {:number => 0,
                            :shoe => 16,
                            :points => 22,
                            :rebounds => 12,
                            :assists =>12,
                            :steals => 3,
                            :blocks =>1,
                            :slam_dunks =>1}
      },
      {  "Reggie Evans" => {:number => 30,
                            :shoe => 14,
                            :points => 12,
                            :rebounds => 12,
                            :assists =>12,
                            :steals => 12,
                            :blocks =>12,
                            :slam_dunks =>7}
      },
      { "Brook Lopez" => {  :number => 11,
                            :shoe => 17,
                            :points => 17,
                            :rebounds => 19,
                            :assists =>10,
                            :steals => 3,
                            :blocks =>1,
                            :slam_dunks =>15}
      },
      { "Mason Plumlee" => {:number => 1,
                            :shoe => 19,
                            :points => 26,
                            :rebounds => 11,
                            :assists =>6,
                            :steals => 3,
                            :blocks =>8,
                            :slam_dunks =>5}
      },
      { "Jason Terry" => {  :number => 31,
                            :shoe => 15,
                            :points => 19,
                            :rebounds => 2,
                            :assists =>2,
                            :steals => 4,
                            :blocks =>11,
                            :slam_dunks =>1}
        }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players =>
      [{
        "Jeff Adrien" => {  :number => 4,
                            :shoe => 18,
                            :points => 10,
                            :rebounds => 1,
                            :assists =>1,
                            :steals => 2,
                            :blocks =>7,
                            :slam_dunks =>2}
      },
      {"Bismack Biyombo"=>{ :number => 0,
                            :shoe => 16,
                            :points => 12,
                            :rebounds => 4,
                            :assists =>7,
                            :steals => 22,
                            :blocks =>15,
                            :slam_dunks =>10}
      },
      { "DeSagna Diop" => { :number => 2,
                            :shoe => 14,
                            :points => 24,
                            :rebounds => 12,
                            :assists =>12,
                            :steals => 4,
                            :blocks =>5,
                            :slam_dunks =>5}
      },
      { "Ben Gordon" => {   :number => 8,
                            :shoe => 15,
                            :points => 33,
                            :rebounds => 3,
                            :assists =>2,
                            :steals => 1,
                            :blocks =>1,
                            :slam_dunks =>0}
      },
      { "Kemba Walker" => { :number => 33,
                            :shoe => 15,
                            :points => 6,
                            :rebounds => 12,
                            :assists =>12,
                            :steals => 7,
                            :blocks =>5,
                            :slam_dunks =>12}

        }]
        }
      }
end

def num_points_scored(name)
  game_hash.each do |location,team_data|
  team_data[:players].each do |player_info|
    player_info.each do |player_name,stats|
      if name == player_name
        return stats[:points]
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location,team_data|
  team_data[:players].each do |player_info|
    player_info.each do |player_name,stats|
      if name == player_name
        return stats[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location,team_data|
      if team_data[:team_name] == team
        return team_data[:colors]
        end
      end
    end

  def team_names
    teams=[]
    game_hash.each do |location,team_data|
          teams << team_data[:team_name]
    end
    teams
  end

  def player_numbers(team)
    player_numbers =[]
    game_hash.each do |location,team_data|
      if team_data[:team_name]==team
        team_data[:players].each do |player_info|
          player_info.each do |player_name,stats|
            player_numbers << stats[:number]
          end
        end
      end
    end
      player_numbers
    end

  def player_stats(player)
    game_hash.each do |location,team_data|
      team_data[:players].each do |player_info|
        player_info.each do |player_name,stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      player_info.each do |player_name,stats|
          if stats[:shoe] > biggest_shoe
            biggest_shoe = stats[:shoe]
            rebounds = stats[:rebounds]
      end
    end
  end
end
rebounds
end


def most_points_scored
  points_scored = 0
  scorer = " "
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      player_info.each do |player_name,stats|
        if stats[:points] > points_scored
          points_scored = stats[:points]
          scorer = player_name
        end
      end
    end
  end
  scorer
  end

def winning_team
home_points = 0
away_points = 0
winner = ""
game_hash.each do |location,team_data|
if location == :home
  team_data[:players].each do |player_info|
    player_info.each do |player_name,stats|
      home_points += stats[:points]
    end
  end
elsif location == :away
  team_data[:players].each do |player_info|
    player_info.each do |player_name,stats|
      away_points += stats[:points]
  end
end
if home_points > away_points
  return game_hash[:home][:team_name]
elsif away_points > home_points
  return game_hash[:home][:team_name]
end
end

def player_with_longest_name
  longest_name = " "
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      player_info.each do |player_name,stats|
        if player_name.length > longest_name.length
        longest_name = player_name
        end
      end
    end
  end
  longest_name
end
end
end


def long_name_steals_a_ton?
  longest_name = " "
  steals = 0
  game_hash.each do |location,team_data|
    team_data[:players].each do |player_info|
      player_info.each do |player_name,stats|
        if player_name.length > longest_name.length
        longest_name = player_name
        end
        if stats[:steals] > steals
          steals = stats[:steals]
        end
        if team_data[:players][0][longest_name][:steals] = steals

          return true
        else
          return false
        end
      end
    end
  end
end
