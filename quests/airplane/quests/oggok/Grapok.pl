sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name. Did [Bordag send you]?");
}
if($text=~/Bordag sent me/i){
quest::say("So you want learn about how to fight like bear and crush enemy with bare hand? That good. Best way to start is just go out and do it. Biggest enemy around here lizard men. You go practice. Fight against lizard men. Bring me their tasty meat. You bring four, but only if you fight like bear.");
}

if($text=~/silk threads/i){
quest::say("You better get used to repairing your own armor. Sew two spiderling threads together in a sewing kit to create one silk thread.");
}

}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 13410 => 4)) && ($race eq "Ogre") && ($class eq "Beastlord")) {
    quest::emote("smiles an almost toothless ogre smile.");
    quest::say("Pretty good, but still too soon to tell.  You fight like cub. Bring me four [silk threads] to continue your training.");
    quest::summonitem(7375);
  	quest::faction(46,10); # Clurg
    quest::faction(57,10); # Craknek Warriors
    quest::faction(128,10); # Greenblood Knights
  }
  elsif ((plugin::check_handin(\%itemcount, 16486 => 4)) && ($race eq "Ogre") && ($class eq "Beastlord")) {
    quest::emote("smiles an almost toothless ogre smile.");
    quest::say("That was quick. Now for something harder. Bring me a mystic doll from the lizardmen. It's time you fought something smarter than you are.");
    quest::summonitem(7376);
    }
  elsif ((plugin::check_handin(\%itemcount, 13367 => 1)) && ($race eq "Ogre") && ($class eq "Beastlord")) {
    quest::emote("grins.");
    quest::say("Pretty good. Now for something larger than even you. Bring me two giant bat wings and two giant bat furs.");
    quest::summonitem(7377);
    }
  elsif ((plugin::check_handin(\%itemcount, 13061 => 2, 13062 => 2)) && ($race eq "Ogre") && ($class eq "Beastlord")) {
    quest::emote("nods approvingly.");
    quest::say("That was alright. Now for your toughest challenge yet. Bring me four lizard tails, and you'll fight like a true bear.");
    quest::summonitem(7378);
    }  
  elsif ((plugin::check_handin(\%itemcount, 13354 => 4)) && ($race eq "Ogre") && ($class eq "Beastlord")) {
    quest::emote("is satisfied.");
    quest::say("Now be the bear.");
    quest::summonitem(7379);
    quest::faction(46,10); # Clurg
    quest::faction(57,10); # Craknek Warriors
    quest::faction(128,10); # Greenblood Knights
    quest::exp(10850);
    quest::ding();
    }          
  #do all other handins first with plugin, then let it do disciplines
  else {
    plugin::return_items(\%itemcount);
    quest::say("Don't need it, but thanks.");
    }
}
