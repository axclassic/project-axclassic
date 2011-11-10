sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("FROOAAAK!");
    }
  if ($text=~/Glib sent me/i) {
    quest::emote("scowls at you despite his obvious pain and torment.");
    quest::say("I don't believe you, glooaak $name. Prove it.  Bring me the necklace of a troll basher, and then we'll see with whom you ally.");
    }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 13311 => 1)) { #Intestine Necklace from Troll bashers
     quest::summonitem(1892); # Non-Container Empty Jar
     quest::say("I bet that was a trick to get.  In any case, thanks. I think I can see why Glib sent you.");
     quest::emote("hands you an empty jar.");
     quest::say("Take this to Forager Grikk in Innothule Swamp. He has something I need badly.  Be careful and discrete, and all will be revealed.");
     quest::faction(66,-50); #Da Bashers don't like this.   
      }
   elsif(plugin::check_handin(\%itemcount, 13376 => 1)) { #Ochre Liquid from Forager Grikk
     quest::emote("smiles as he poors the ochre liquid on the bars.");
     quest::say("Here, take this note back to Marda. She needs to know the truth and will know what to do. Hopefully, I won't be here if or when you return.");
     quest::summonitem(18884); #Tattered Note 
     quest::faction(66,-150); #Da Bashers really don't like this.
      }
   else {
    quest::say("Whatever will I do with this right about now?");
    plugin::return_items(\%itemcount); #function from file plugins/check_handin.pl
     }
     
}