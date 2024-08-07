#Councilman_Taldarius.pl
#Signets of the Councilmen

sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("regards you, and grins. 'Greetings, $name. I am Councilman Taldarius, mighty Paladin of Mithaniel Marr and Guardian of the City of Tanaan! If you cannot find what you are looking for here in the Myrist library, I most certainly can add it to my list of things to look for in the Planes. Unfortunately, I am quite busy at the moment, planning my next trip to the Elemental Planes. I believe my aid may have some tasks he could use help with. That is, if you are skilled enough.'");
	}
	elsif ($text=~/marked runed signet/i){
		quest::say("I see you have helped Grimel immensely. He would not have given up his signet very easily. I cannot let him deprive himself of such a valuable tool. If you were to do a task for me I would grant you something I picked up in the Planes. Are you interested in the task?");
	}
	elsif ($text=~/interested in the task/i){
		quest::say("Very well $name. I warn you I will not grant this without proof that you possess a valiant spirit. You may have the trust of my aid but I still require a noble deed. Through research done by the council they have discovered something called a Hope Stone that exists in the Elemental Planes. Bring me one of these stones and the signet of Grimel. Fear not I shall reward you well.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 16256 => 1, 16258 => 1)) {#Marked Runed Signet, Hope Stone
		quest::say("Wonderful! You have proven yourself as both a Master of the Trade as well as a valiant spirit. Take this and may it server you well! If this signet does not suffice, bring it back to me and i will exchange it for one more attuned to your needs.");
		quest::summonitem(16255);#Signet of Might
  }
  #Supposed to be swappable
  elsif (plugin::check_handin(\%itemcount, 16255 => 1)) {#Signet of Might
  	quest::say("I hope this is more attuned to your needs.");
  	quest::summonitem(16257);#Signet of the Arcane
  }
  elsif (plugin::check_handin(\%itemcount, 16257 => 1)) {#Signet of the Arcane
  	quest::say("I hope this is more attuned to your needs.");
  	quest::summonitem(16255);#Signet of Might
  }
  else {
      my $stuff = (\%itemcount);
      my $yes = 2;
      foreach my $k (keys(%{$stuff})) {
          next if($k == 0);
          $yes = 1;
      }
      if($yes == 1) {
          quest::say("I don't need this $name. Take it back.");
          plugin::return_items(\%itemcount);
      }
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
          quest::say("Thanks for the coin!");
      }
  }
}
#END of FILE Zone:poknowledge  ID:202126 -- Councilman_Taldarius 