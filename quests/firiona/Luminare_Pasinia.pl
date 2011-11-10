sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("waves her hands as if to cast a spell.");
  quest::say("Greetings!! I am the Luminare of Firiona. By decree of his royal highness, King Thex, I am here to research spells and artifacts. I have much to do. I welcome any enchanter who offers to [assist the great Luminare].");
 }
 elsif($text=~/assist the great Luminare/i){
  quest::say("And great I am, indeed!! Alas, not great enough to be everywhere at once. I would gladly reward you if you would [collect components] for me.");
 }
 elsif($text=~/collect components/i){
  quest::say("Then go into the wilds beyond the outpost and upon your return, you shall give me one Nok Shaman Powder, one Heart of Ice, one Ton Warrior Totem, and one Sabertooth Tiger Mane. This shall earn you knowledge of an enchanter spell I recently scribed.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x Nok Shaman Powder (12948), 1x Heart of Ice (12834), 1x Ton Warrior Totem (12743), 1x Sabertooth Tiger Mane (12824)
 if(plugin::check_handin(\%itemcount, 12948 => 1, 12834 => 1, 12743 => 1, 12824 => 1)){
  quest::emote("places the items into a sack and removes a scroll from her robe.");
  quest::say("This is yours. A spell I discovered and translated for one with less intelligence than the great Luminare of Firiona Vie. You may kiss my feet now.");
  quest::faction(418,100); # +Inhabitants of Firiona Vie
  quest::faction(92,100);  # +Emerald Warriors
  quest::faction(314,100); # +Storm Guard
  quest::faction(193,-1);  # -Legion of Cabilis
  quest::faction(250,-1);  # -Pirates of Gunthak    
   quest::ding(); quest::exp(250);
  quest::summonitem('12949'); #Spell: Vision of Sebilite (Illusion:Iksar)(12949)
 }
 #Handin: 1x Nok Shaman Powder (12948), 1x Heart of Ice (12834), 1x Ton Warrior Totem (12744), 1x Sabertooth Tiger Mane (12824)
 elsif(plugin::check_handin(\%itemcount, 12948 => 1, 12834 => 1, 12744 => 1, 12824 => 1)){
  quest::emote("places the items into a sack and removes a scroll from her robe.");
  quest::say("This is yours. A spell I discovered and translated for one with less intelligence than the great Luminare of Firiona Vie. You may kiss my feet now.");
  quest::faction(418,100); # +Inhabitants of Firiona Vie
  quest::faction(92,100);  # +Emerald Warriors
  quest::faction(314,100); # +Storm Guard
  quest::faction(193,-1);  # -Legion of Cabilis
  quest::faction(250,-1);  # -Pirates of Gunthak    
   quest::ding(); quest::exp(250);
  quest::summonitem('12949'); #Spell: Vision of Sebilite (Illusion:Iksar)(12949)
 }
 else {
  quest::say("I have no need for this item, $name. You can have it back.");
  plugin::return_items(\%itemcount);
 }
}


#Scripted By: Fatty Beerbelly