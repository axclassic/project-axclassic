#######################################
## NPC: Kevan_McPherson              ##
## Zone: Halas                       ##
## Quest: The Rathe Prestige Quest   ##
##        Shield Frame Mold          ##
##        (Guktan Shield No. 2)      ##
## Created by Caved for AXClassic    ##
## EQWorld Server     29-08-2014     ##
#######################################
sub EVENT_SAY {

if($text=~/hail/i) {
  $client->Message(14,"Well met, $name! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
  }
  if($text=~/kintok/i) {
  $client->Message(14,"He did, did he? How is that fool doing? Its been a while since I saw him last! So, what has he sent you here for? Oh, a mold? I have a stockpile of those laying around. I suppose I could part with one if you were able to somehow get a fire goblin skin.");
  }
  if($text=~/what northman kite shields/i){
  $client->Message(14,"To smith a Northman kite shield ye'll need a kite shield mold. a smithy hammer. a flask of water and a medium quality folded sheet metal. Remember ye'll have ta smith the metal sheet in a regular forge and finish the shield in our special Northman forge."); 
  }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,2361 => 1)) { #Fire Goblin Skin
    $client->Message(14,"Well, arent you full of surprises! I appreciate you retrieving this for me, as I cant really leave my shop here for very long, the services I provide are nearly irreplacable. As promised, here is your mold! Good luck!");    
    quest::summonitem(51114); #Shield Frame Mold
  }
elsif(plugin::check_handin(\%itemcount,119947 => 1) && $ulevel == 65) { #Rathe Prestige Quest
    $client->Message(14,"Ahh I see my friend Melvin send you. I will sharpen this dagger so he can go on his dragon hunt..");    
    quest::summonitem(119951); #Sharpened Dragon Dagger
  }
  else {
    $client->Message(14,"I have no need for this, $name.");
    quest::return_items(\%itemcount);
  }
}
