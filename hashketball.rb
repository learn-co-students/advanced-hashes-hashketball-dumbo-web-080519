require "pry"

def game_hash
game_hash = {   
  :home =>                   
  {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players =>     
    [
      {
        :name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :name => "Jason Terry",
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
  {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        :name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :name => "Kemba Walker",
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



def num_points_scored(player_name)
    players_array = game_hash[:home][:players] + game_hash[:away][:players]
    players_array.each do |player|
     if player[:name]  == player_name
      return player[:points]
     end
    end
end

p num_points_scored("Kemba Walker")

def shoe_size(player_name)
    players_array = game_hash[:home][:players] + game_hash[:away][:players]
    players_array.each do |player|
     if player[:name]  == player_name
      return player[:shoe]
     end
    end
end

p shoe_size("Kemba Walker")


def team_colors(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:colors]
    end
  end
end

p team_colors("Brooklyn Nets")

def team_names
  game_hash.map {|home_away, keys| keys[:team_name]}
end

p team_names

def player_numbers(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:players].map { |player| player[:number] }
    end
  end
end

p player_numbers("Brooklyn Nets")
 
def player_stats(player_name)
 players_array = game_hash[:home][:players] + game_hash[:away][:players]
 players_array.map do |player|
   if player[:name] == player_name
      player.shift
      return player
   end
 end
end


p player_stats("Jeff Adrien")

def big_shoe_rebounds
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
   max = players_array[0][:shoe]
   rebound = 0
  players_array.map do |player|
    if player[:shoe] > max
      max = player[:shoe]
      rebound = player[:rebounds]
    end
  end
  return rebound
end

p big_shoe_rebounds


# # Bonus

def most_points_scored
   players_array = game_hash[:home][:players] + game_hash[:away][:players]
    max_points = players_array[0][:points]
    name = ""
    players_array.map do |player|
      if player[:points] > max_points
        max_points = player[:points]
        name = player[:name]
      end
    end
    return name
end



p most_points_scored

def winning_team
  top_team = {}
  game_hash.each do |home_away, team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    top_team[team_info[:team_name]] = team_points
  end
  top_team.key(top_team.values.max)
end

p winning_team

def player_with_longest_name
    players_array = game_hash[:home][:players] + game_hash[:away][:players]
    longest_name = ""
    max = players_array[0][:name].delete(" ").length
    players_array.each do |player_name|
      if player_name[:name].delete(" ").length > max
        max = player_name[:name].delete(" ").length
        longest_name = player_name[:name]
      end
    end
    return longest_name
end

p player_with_longest_name


def long_name_steals_a_ton?
  steal_most = 0
  players_array = game_hash[:home][:players] + game_hash[:away][:players]
  players_array.each do |player|
    if player[:steals].to_i > steal_most.to_i
      steal_most = player[:name]
      if player[:name] == player_with_longest_name
        return true
      end
    end
  end
end

p long_name_steals_a_ton?
