class Player
  
  def initialize
    @health = 20
  end
  
  def hurt(warrior)
    @health < 20
  end
  
  def taking_damage(warrior)
    warrior.health < @health
  end
  
  def captives(warrior)
    warrior.rescue! if warrior.feel.captive?
  end
  
  def retreat(warrior)
    if warrior.health < 12
      warrior.walk!(:backward)
    end
  end
  
  def alone_and_hurt(warrior)
    if hurt(warrior) and !taking_damage(warrior)
      warrior.rest! unless @health > 15
    end
  end
  
  def captives_backward(warrior)
    if warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    end
  end
  
  def rescue_back_otw(warrior)
    if warrior.look(:backward)[0].to_s == "Captive" || warrior.look(:backward)[1].to_s == "Captive" || warrior.look(:backward)[2].to_s == "Captive"
      warrior.walk!(:backward)
    end
  end
  
  def attack(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    end
  end
  
  def long_distance_attack(warrior)
    if warrior.look[2].to_s == "Wizard" || warrior.look[2].to_s == "Archer"
      warrior.shoot!
    end
  end
  
  def turn_around(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    end
  end
  
  def onward(warrior)
    if !taking_damage(warrior) && warrior.feel.empty?
      warrior.walk!
    end
  end
  
  def getem(warrior)
    if taking_damage(warrior) && warrior.feel.empty?
      warrior.walk!
    end
  end
  
  def play_turn(warrior)
      
    if warrior.look[1].to_s == "Captive" && !warrior.feel.enemy?
      warrior.walk!     
    elsif captives(warrior)   
    elsif captives_backward(warrior)  
    elsif rescue_back_otw(warrior) 
    elsif attack(warrior)
    elsif long_distance_attack(warrior)
    elsif alone_and_hurt(warrior)
    elsif turn_around(warrior)   
    elsif onward(warrior)
    elsif getem(warrior)
    end
    @health = warrior.health
    
  end
end
