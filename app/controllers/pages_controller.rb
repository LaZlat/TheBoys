class PagesController < ApplicationController
  before_action :generate_heroname

  def generate_heroname
    hero_array = ["The Whispering Lion",
    "The Voiceless Katana",
    "The Black Sparrow",
    "The Wacky Devil",
    "Eager Dragonfly",
    "Agent Marked Sage",
    "Fabulous Mothman",
    "Master Quick Defender",
    "Nightwave",
    "Alpha Dog"]

    @the_hero = hero_array.sample
  end
  
end
