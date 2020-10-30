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

  def characters
    chars = []
    the_seven = []
    chars.push(Character.new(
      "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2019/08/04/855674-the-boys-new.jpg",
      "Billy Butcher",
      "A former member of the British special forces turned vigilante, Billy Butcher is as charming as he is cunning. He’s a force of nature, who can talk almost anyone into anything, either through a smile or brute force – or sometimes both. He’s consumed by one mission in life: to destroy superheroes."))
    chars.push(Character.new(
      'https://vignette.wikia.nocookie.net/amazons-the-boys/images/a/a2/Hughie.png/revision/latest?cb=20190730232949',
      'Hughie Campbell',
      'The only light in his life is the love of his life: his girlfriend, Robin. That is, until a speedster superhero named A-Train runs through Robin, eviscerating and killing her on impact. Desperate for revenge, Hughie’s recruited by anti-“Supe” vigilante Billy Butcher, and Hughie’s world is turned upside down as he finds himself caught in the middle of a war against superheroes – who, as it turns out, are neither super nor heroic.'
    ))
    chars.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/1/14/Frenchie_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200911125421',
      'Frenchie',
      "Frenchie (real name Serge) is one of the main characters in the Amazon series The Boys and a member of the vigilante group, The Boys. Despite his name, he is actually French - Algerian."
    ))
    chars.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/c/ce/Mothers_Milk_S2.jpg/revision/latest/scale-to-width-down/620?cb=20200906145235',
      'Mothers Milk',
      'Marvin T. "Mother\'s" Milk, or M.M., is one of the main characters in the Amazon series The Boys and an original member of black ops group The Boys.'
    ))
    chars.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/b/ba/The_Female_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200911124511',
      'The Feamle',
      'When The Boys find The Female imprisoned in a cage in a basement under high security, they mistake her for a victim in desperate need of saving. But as The Boys unravel the mystery of The Female, they follow a trail of blood and gore to learn that she’s a badass who might just end up saving them instead.'
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/6/60/Homelander_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808192351',
      'Homelander',
      'Homelander, who is occasionally referred to as John by Vought International, is the main antagonist in the Amazon series The Boys. He is the leader of The Seven, and the prime enemy of Billy Butcher, the leader of The Boys.'
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/2/24/Queen_Maeve_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808192442',
      'Queen Maeve',
      'As a warrior, a feminist, a humanitarian, and second most powerful member of The Seven, Queen Maeve is the ultimate role model for little girls all over the world. But to reach such astonishing heights, she’s had to make sacrifices along the way. Embracing the image that Vought demanded she accept meant abandoning the truths – and even some of the people – she held dear.'
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/7/77/Black_Noir_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808192659',
      'Black Noir',
      'Silent, stealthy, and enigmatic, Black Noir is The Seven’s superpowered ninja. His super strength and heightened senses are matched only by his proficiency in the martial arts. Criminals run in terror at the mere mention of his name. Little is known about this lethal warrior, other than having trained with a master sensei to become the death dealer he is at present.'
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/d/d4/A-Train_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808192510',
      'A-Train',
      'A-Train (real name Reggie Franklin) is one of the main characters in the Amazon series The Boys. He is a speedster who used to be a part of the team known as the Teenage Kix, and is a returning member of The Seven. He inadvertently killed Robin Ward (Hughie Campbell\'s girlfriend) with his powers while high on Compound V, the event which ultimately lead to Hughie joining The Boys.'
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/f/f0/Startlight_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808192418',
      'Starlight',
      'Starlight (real name Annie January) is one of the main characters in the Amazon series The Boys. She\'s a member of The Seven, a group of superheroes. She was briefly excommunicated from the group after she was discovered to be a mole and ally of The Boys.',
    ))

    the_seven.push(Character.new(
      'https://static.wikia.nocookie.net/amazons-the-boys/images/b/bd/Stormfront_S2.jpg/revision/latest/scale-to-width-down/619?cb=20200808194916',
      'Stormfront',
      'Stormfront (formerly known as Liberty, real name Klara Risinger) is one of the main antagonists of the second season of the Amazon series The Boys. She is a superhero who replaces Translucent as a member of The Seven.',
    ))

    respond_to do |format|
      format.html { render :characters, locals: { chars: chars, the_seven: the_seven } }
    end
  end
  

  # chars = [
    # Character. new(
    #   'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2019/08/04/855674-the-boys-new.jpg',
    #   'Billy Butcher',
    #   'A former member of the British special forces turned vigilante, Billy Butcher is as charming as he is cunning. He’s a force of nature, who can talk almost anyone into anything, either through a smile or brute force – or sometimes both. He’s consumed by one mission in life: to destroy superheroes.'
    # )
    # Character. new(
    #   'https://vignette.wikia.nocookie.net/amazons-the-boys/images/a/a2/Hughie.png/revision/latest?cb=20190730232949',
    #   'Hughie Campbell',
    #   'The only light in his life is the love of his life: his girlfriend, Robin. That is, until a speedster superhero named A-Train runs through Robin, eviscerating and killing her on impact. Desperate for revenge, Hughie’s recruited by anti-“Supe” vigilante Billy Butcher, and Hughie’s world is turned upside down as he finds himself caught in the middle of a war against superheroes – who, as it turns out, are neither super nor heroic.'
    # )
  # ]


  
end
