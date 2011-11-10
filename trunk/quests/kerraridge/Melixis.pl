#############
#NPC: Melixis
#Quest Name: Kerran Class Rings, Paw of Opolla
#Quest by: Angelox
#Revised: Olhadon
#NPCs Involved: Taruun Guardian Meliij, Fungus Mutant
#Items Involved: #Melixis Ring ID: 103, Kerran Warrior Ring ID:106, Kerran Cleric Ring ID:114, Kerran Ranger Ring ID:111, Kerran Paladin Ring ID:110, Kerran Shadowknight Ring ID:109, Kerran Druid Ring ID:115, Kerran Monk Ring ID:107, Kerran Bard Ring ID:113, Kerran Rogue Ring ID:108, Kerran Shaman Ring ID:116, Kerran Necromancer Ring ID:120, Kerran Wizard Ring ID:117, Kerran Magician Ring ID:118, Kerran Enchanter Ring ID:119, Kerran Beastlord Ring ID:112, Kerran Berserker Ring ID:121, Guk Bracket Mildew ID:14042, Degenerated Guk Weed ID:14044, Faerix Spores ID:14043, Copper Ring ID:13733, Silver Ring ID:13731, Gold Ring ID:13732
#zone: kerraridge

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 300; # ~5minutes
  my $upper = 1800; # ~30minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("looks up at you");
    quest::say("Welcome to Melixis' shop. Rrrr. Feel free to brrrowse thrrrough my warrres. Melixis also find some [shiny tings] she may trade you.");
  }
  elsif ($text=~/what ring/i){
    quest::emote("sadly looks at the floor");
    quest::say("Have ring long time, mother give to me. You [find]?");
  }
  elsif ($text=~/I.*?find/i){
    quest::emote("looks at her empty finger");
    quest::say("Make Melixis happy, find ring. I give you something");
  }
  elsif ($text=~/what shiny tings/i){
    quest::say("In Melixis' travels of the Odus, she find a [dull ring], a [kinda shiny ring] and a [really shiny ring].  Maybe you want to trade for those tings?  Rrrr..");
  }
  elsif ($text=~/what dull ring/i){
    quest::say("For dat ting?  You brrring Melixis some bracket mildew.  Rarr..");
  }
  elsif ($text=~/what kinda shiny ring/i){
    quest::say("Hmm... Hamed need faerix spores forrr potion. Rrrrr. You brring some to Melixis and she give you the kinda shiny ring.");  
  }
  elsif ($text=~/what really shiny ring/i){
    quest::say("You go find degenerated guk weed and Melixis gives you the really shiny ring.");    
  }
}

sub EVENT_ITEM{
  #Melixis Ring ID: 103
  if($itemcount{103} == 1) {
    quest::emote("beams with glee.");
    quest::say("Oh $name, you too kind. Take this for finding my ring.");
    quest::say("Thank you!");
    quest::ding(); quest::exp(25);
    #Kerran Warrior Ring ID:106
    if($class eq 'Warrior'){quest::summonitem(106);
    }
    #Kerran Cleric Ring ID:114
    elsif($class eq 'Cleric'){quest::summonitem(114);
    }
    #Kerran Ranger Ring ID:111
    elsif($class eq 'Ranger'){quest::summonitem(111);
    }
    #Kerran Paladin Ring ID:110
    elsif($class eq 'Paladin'){quest::summonitem(110);
    }
    #Kerran Shadowknight Ring ID:109
    elsif($class eq 'Shadowknight'){quest::summonitem(109);
    }
    #Kerran Druid Ring ID:115
    elsif($class eq 'Druid'){quest::summonitem(115);
    }
    #Kerran Monk Ring ID:107
    elsif($class eq 'Monk'){quest::summonitem(107);
    }
    #Kerran Bard Ring ID:113
    elsif($class eq 'Bard'){quest::summonitem(113);
    }
    #Kerran Rogue Ring ID:108
    elsif($class eq 'Rogue'){quest::summonitem(108);
    }
    #Kerran Shaman Ring ID:116
    elsif($class eq 'Shaman'){quest::summonitem(116);
    }
    #Kerran Necromancer Ring ID:120
    elsif($class eq 'Necromancer'){quest::summonitem(120);
    }
    #Kerran Wizard Ring ID:117
    elsif($class eq 'Wizard'){quest::summonitem(117);
    }
    #Kerran Magician Ring ID:118
    elsif($class eq 'Magician'){quest::summonitem(118);
    }
    #Kerran Enchanter Ring ID:119
    elsif($class eq 'Enchanter'){quest::summonitem(119);
    }
    #Kerran Beastlord Ring ID:112
    elsif($class eq 'Beastlord'){quest::summonitem(112);
    }
    #Kerran Berserker Ring ID:121
    elsif($class eq 'Berserker'){quest::summonitem(121);
    }
  }
  #Guk Bracket Mildew ID:14042
  elsif($itemcount{14042} == 1){
    quest::say("Many thanks.. rrr.. here is dull ring");
    #Copper Ring ID:13733
    quest::summonitem(13733);
    quest::ding(); quest::exp(50000);
  }
  #Degenerated Guk Weed ID:14044
  elsif($itemcount{14044} == 1){
    quest::say("Melixis thanks you. Hamed will be pleased. A kinda shiny ring is yours.");
    #Silver Ring ID:13731
    quest::summonitem(13731);
    quest::ding(); quest::exp(50000);
  }
  #Faerix Spores ID:14043
  elsif($itemcount{14043} == 1){
    quest::say("You done good job, furless one. Here is really shiny ring. Rarr..");
    #Gold Ring ID:13732
    quest::summonitem(13732);
    quest::ding(); quest::exp(50000);
  }
  else {
    quest::say("I have no use for this");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_COMBAT{
  my $random_result = int(rand(100));
  if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
  }
  elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
  }
  elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
  }
  elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
  }
  elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");
  }
}

sub EVENT_DEATH{
  quest::emote("'s corpse drops to the ground.");
}

sub EVENT_TIMER{
  quest::emote("looks around for her lost [ring]..");
  quest::stoptimer(1);
  #Generating random number for timer.
  my $lower = 300; # ~5minutes
  my $upper = 1800; # ~30minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum);
}

#END of FILE Zone:kerraridge  ID:74076 -- Melixis

