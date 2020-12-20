# frozen_string_literal: true

# PagesController class
class PagesController < ApplicationController
  before_action :start
  protect_from_forgery with: :null_session
  helper_method :delete_user

  def start
    generate_heroname
    gets_comments
    gets_users
    @the_user = cookies[:UserCookie]
  end

  def generate_heroname
    hero_array = ['The Whispering Lion',
                  'The Voiceless Katana',
                  'The Black Sparrow',
                  'The Wacky Devil',
                  'Eager Dragonfly',
                  'Agent Marked Sage',
                  'Fabulous Mothman',
                  'Master Quick Defender',
                  'Nightwave',
                  'Alpha Dog']

    @the_hero = hero_array.sample
  end

  def characters
    chars = []
    the_seven = []
    chars.push(Character.new(
                 'https://media.giphy.com/media/l0cydYWK8uWpXEaplL/giphy.gif',
                 'Billy Butcher',
                 'A former member of the British special forces turned vigilante, Billy Butcher is as charming as he is cunning. He’s a force of nature, who can talk almost anyone into anything, either through a smile or brute force – or sometimes both. He’s consumed by one mission in life: to destroy superheroes.'
               ))
    chars.push(Character.new(
                 'https://vignette.wikia.nocookie.net/amazons-the-boys/images/a/a2/Hughie.png/revision/latest?cb=20190730232949',
                 'Hughie Campbell',
                 'The only light in his life is the love of his life: his girlfriend, Robin. That is, until a speedster superhero named A-Train runs through Robin, eviscerating and killing her on impact. Desperate for revenge, Hughie’s recruited by anti-“Supe” vigilante Billy Butcher, and Hughie’s world is turned upside down as he finds himself caught in the middle of a war against superheroes – who, as it turns out, are neither super nor heroic.'
               ))
    chars.push(Character.new(
                 'https://sciencefiction.com/wp-content/uploads/2020/07/Mothers_Milk-750x422.jpg',
                 'Mother\'s Milk',
                 'Marvin T. "Mother\'s" Milk, or M.M., is one of the main characters in the Amazon series The Boys and an original member of black ops group The Boys.'
               ))
    chars.push(Character.new(
                 'https://media.giphy.com/media/a9sXgRaXP3UeIqOgry/giphy.gif',
                 'Frenchie',
                 'Frenchie (real name Serge) is one of the main characters in the Amazon series The Boys and a member of the vigilante group, The Boys. Despite his name, he is actually French - Algerian.'
               ))

    chars.push(Character.new(
                 'https://static2.cbrimages.com/wordpress/wp-content/uploads/2020/09/The-Boys-S2E3-Kimiko-Closeup.jpg',
                 'Kimiko',
                 'When The Boys find The Female imprisoned in a cage in a basement under high security, they mistake her for a victim in desperate need of saving. But as The Boys unravel the mystery of The Female, they follow a trail of blood and gore to learn that she’s a badass who might just end up saving them instead.'
               ))

    the_seven.push(Character.new(
                     'https://www.tvinsider.com/wp-content/uploads/2019/08/the-boys-homelander.jpg',
                     'Homelander',
                     'Homelander, who is occasionally referred to as John by Vought International, is the main antagonist in the Amazon series The Boys. He is the leader of The Seven, and the prime enemy of Billy Butcher, the leader of The Boys.'
                   ))

    the_seven.push(Character.new(
                     'https://img1.looper.com/img/gallery/why-the-boys-fans-are-so-confused-about-queen-maeve/intro-1603065104.jpg',
                     'Queen Maeve',
                     'As a warrior, a feminist, a humanitarian, and second most powerful member of The Seven, Queen Maeve is the ultimate role model for little girls all over the world. But to reach such astonishing heights, she’s had to make sacrifices along the way. Embracing the image that Vought demanded she accept meant abandoning the truths – and even some of the people – she held dear.'
                   ))

    the_seven.push(Character.new(
                     'https://static0.srcdn.com/wordpress/wp-content/uploads/2020/07/Everyone-Love-Black-Noir-Cropped.jpg',
                     'Black Noir',
                     'Silent, stealthy, and enigmatic, Black Noir is The Seven’s superpowered ninja. His super strength and heightened senses are matched only by his proficiency in the martial arts. Criminals run in terror at the mere mention of his name. Little is known about this lethal warrior, other than having trained with a master sensei to become the death dealer he is at present.'
                   ))

    the_seven.push(Character.new(
                     'https://patch.com/img/cdn20/users/131055/20161018/103611/styles/raw/public/article_images/atrain2-1476801345-2260.jpg',
                     'A-Train',
                     'A-Train (real name Reggie Franklin) is one of the main characters in the Amazon series The Boys. He is a speedster who used to be a part of the team known as the Teenage Kix, and is a returning member of The Seven. He inadvertently killed Robin Ward (Hughie Campbell\'s girlfriend) with his powers while high on Compound V, the event which ultimately lead to Hughie joining The Boys.'
                   ))

    the_seven.push(Character.new(
                     'https://media.giphy.com/media/MoBpuBjSOxeKmKpbXF/giphy.gif',
                     'Starlight',
                     'Starlight (real name Annie January) is one of the main characters in the Amazon series The Boys. She\'s a member of The Seven, a group of superheroes. She was briefly excommunicated from the group after she was discovered to be a mole and ally of The Boys.'
                   ))

    the_seven.push(Character.new(
                     'https://www.indiewire.com/wp-content/uploads/2020/09/the-boys-season-2-THBY_S2_Unit_204_0338RC_rgb.jpg?w=780',
                     'Stormfront',
                     'Stormfront (formerly known as Liberty, real name Klara Risinger) is one of the main antagonists of the second season of the Amazon series The Boys. She is a superhero who replaces Translucent as a member of The Seven.'
                   ))
    # cia

    respond_to do |format|
      format.html { render :characters, locals: { chars: chars, the_seven: the_seven } }
    end
  end

  def add_comment
    return if cookies[:UserCookie] == ''

    required = %i[username comment]
    form_complete = true
    required.each do |f|
      if params.key?(f) && !params[f].blank?
        # OK
      else
        form_complete = false
      end
    end

    @usr = User.find(cookies[:userId])
    @usr.comms.create(username: @the_user, comment: params[:comment])

    render :heroname
  end

  def delete_user
    return if cookies[:UserCookie] == ''

    @usr = User.find(cookies[:userId])
    @usr.destroy
    cookies[:UserCookie] = ''
  end

  def gets_comments
    @comms = Comm.all
  end

  def add_hero_name
    identity = Secretidentity.new(name: params[:name])
    identity.save

    render :heroname
  end

  def check_hero_name
    identity = Secretidentity.where(name: params[:name]).count
    @searchmsg = if identity != 0
                   "Horray! Hero by the name #{params[:name]} does exist in our database!"
                 else
                   "Ooops! Hero by the name #{params[:name]} does not exist in our database!"
                 end

    render :search
  end

  def deletecomment
    if params[:del_btn]
      Comm.where(comment: params[:co]).destroy
    elsif params[:edit_btn]
      m = Comm.where(comment: params[:co])
      m.update_all(comment: params[:comment])
    end

    render :heroname
  end

  def login_user
    if params[:asguest]
      cookies[:UserCookie] = 'Guest'
      @the_user = cookies[:UserCookie]
      render 'pages/index'
    end

    if params[:login]
      found = User.where({ username: params[:Username], password: params[:Password] })
      if found.count.positive?
        cookies[:UserCookie] = params[:Username]
        @the_user = cookies[:UserCookie]
        
        print('cia nx')
        user_ids = User.where(username: params[:Username]).pluck(:id)
        print(user_ids[0], "<-----")
        print(found, "<-----")
        cookies[:userId] = user_ids[0]
        render 'pages/index';
      end
    end
    redirect_to :register if params[:register]
  end

  def register_user
    redirect_to :login if params[:login]
    return unless params[:register]

    required = %i[Username Password]
    form_complete = true
    required.each do |f|
      if params.key?(f) && !params[f].blank?
        # OK
      else
        form_complete = false
      end
    end
    useris = User.new(username: params[:Username], password: params[:Password])
    useris.save if useris.valid?
    redirect_to :login
  end

  def gets_users
    @users = User.all
  end
end
