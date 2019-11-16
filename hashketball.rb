# Write your code here!

require 'pry'

def game_hash
  { 
    :away => { :team_name => "Charlotte Hornets", 
              :colors => ["Turquoise", "Purple"], 
              :players => [
                {:player_name =>"Jeff Adrien", 
                  :number =>4, 
                  :shoe =>18, 
                  :points =>10, 
                  :rebounds =>1, 
                  :assists =>1, 
                  :steals =>2, 
                  :blocks =>7, 
                  :slam_dunks =>2
                }, 
                {:player_name =>"Bismack Biyombo", 
                  :number =>0, 
                  :shoe =>16, 
                  :points =>12, 
                  :rebounds =>4, 
                  :assists =>7, 
                  :steals =>22, 
                  :blocks =>15, 
                  :slam_dunks =>10
                }, 
                {:player_name =>"DeSagna Diop", 
                  :number =>2, 
                  :shoe =>14, 
                  :points =>24, 
                  :rebounds =>12, 
                  :assists =>12, 
                  :steals =>4, 
                  :blocks =>5, 
                  :slam_dunks =>5
                }, 
                {:player_name =>"Ben Gordon", 
                  :number =>8, 
                  :shoe =>15, 
                  :points =>33, 
                  :rebounds =>3, 
                  :assists =>2, 
                  :steals =>1, 
                  :blocks =>1, 
                  :slam_dunks =>0
                }, 
                 {:player_name =>"Kemba Walker", 
                  :number =>33, 
                  :shoe =>15, 
                  :points =>6, 
                  :rebounds =>12, 
                  :assists =>12, 
                  :steals =>7, 
                  :blocks =>5, 
                  :slam_dunks =>12
                 }
                  ]}, 
  :home => {:team_name => "Brooklyn Nets", 
             :colors => ["Black", "White"], 
             :players => [
                {:player_name  =>"Alan Anderson", 
                 :number => 0, 
                 :shoe => 16, 
                 :points => 22, 
                 :rebounds => 12, 
                 :assists => 12, 
                 :steals => 3, 
                 :blocks => 1, 
                 :slam_dunks => 1
                }, 
                {:player_name =>"Reggie Evans", 
                 :number =>30, 
                 :shoe =>14, 
                 :points =>12, 
                 :rebounds =>12, 
                 :assists =>12, 
                 :steals =>12, 
                 :blocks =>12, 
                 :slam_dunks =>7
                }, 
                {:player_name =>"Brook Lopez", 
                 :number =>11, 
                 :shoe =>17, 
                 :points =>17,
                 :rebounds =>19, 
                 :assists =>10, 
                 :steals =>3, 
                 :blocks =>1, 
                 :slam_dunks =>15
                }, 
                {:player_name =>"Mason Plumlee", 
                 :number =>1, 
                 :shoe =>19, 
                 :points =>26, 
                 :rebounds =>11, 
                 :assists =>6, 
                 :steals =>3, 
                 :blocks =>8, 
                 :slam_dunks =>5}, 
                {:player_name =>"Jason Terry", 
                 :number =>31, 
                 :shoe =>15, 
                 :points =>19, 
                 :rebounds =>2, 
                 :assists =>2, 
                 :steals =>4, 
                 :blocks =>11, 
                 :slam_dunks =>1}
                 ]}
    }
end 

  #Helpers

def all_teams
  game_hash.values 
end 

def find_team(team_name)
  all_teams.find { |team| team[:team_name] == team_name }
end 

# Required & completed 

def team_colors(team_name)
  find_team(team_name)[:colors]
end

def team_names
  all_teams.map {|team| team[:team_name]}
end 

def num_points_scored(players_name)
  
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end 
        end 
      end 
    end
  end 
end 

def shoe_size(players_name)
  
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end 
        end 
      end 
    end
  end 
end 

def player_numbers(team_name)
  num = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            num << player[:number]
          end 
        end 
      end 
    end
  end 
  num
end 

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            if player[:player_name] == players_name
              new_hash = player.delete_if do |k,v| 
                k == :player_name
              end 
          end 
        end 
      end 
    end
  end 
  new_hash 
end 

def big_shoe_rebounds 
  shoe_size = 0 
  rebound = 0
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] > shoe_size
            shoe_size = player[:shoe]
            rebound = player[:rebounds]
          end 
        end 
      end 
    end
  end 
  rebound
end 
  
  
def most_points_scored 
  most = 0 
  
  player_array = game_hash[:home][:players].concat game_hash[:away][:players]
  
  player_array.each do |player|
    if player[:points] > most 
      most = player[:points]
    end 
  end 
  most 
  most_player = nil 
  player_array.each do |player|
    if player[:points] == most 
      most_player = player[:player_name]
    end 
  end 
  most_player
end 

def winning_team
  home = []
  away = [] 
  
  away_team = game_hash[:away][:players]
  away_team.each do |player|
    away << player[:points]
  end 
  home_team = game_hash[:home][:players]
  home_team.each do |player|
    home << player[:points]
  end 
  
  away_total = away.sum 
  home_total = home.sum 
  
  if away_total > home_total
    return "Charlotte Hornets"
  else home_total > away_total
    return "Brooklyn Nets"
  end 
  
end 

def player_with_longest_name 
  p_names = []
  
  player_array = game_hash[:home][:players].concat game_hash[:away][:players]
  
  player_array.each do |player|
    p_names << player[:player_name]
  end 
  p_names.max_by(&:length)
end 

def long_name_steals_a_ton?
  
  most = 0 
  
  player_array = game_hash[:home][:players].concat game_hash[:away][:players]
  
  player_array.each do |player|
    if player[:steals] > most 
      most = player[:steals]
    end 
  end 
  most 
  most_player = nil 
  
  player_array.each do |player|
    if player[:steals] == most 
      most_player = player[:player_name]
    end 
  end 
  most_player
  if most_player == player_with_longest_name 
    return true 
  end 
end 