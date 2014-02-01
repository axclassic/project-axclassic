#Developer: Asram
#Status: Incomplete
#Reason: Pending spawnpoint for Emissary Glib, and I don't know how to configure timer/depop yet.

sub EVENT_SAY { 
  if(($text=~/Hail/i) && ($race eq "Ogre"))       {
  quest::say("Welcome to intelligence. young $name! Did you think all ogres were inept? Ha!! I hope you show the glimmer. We shamans need more within our ranks. Our race needs to evolve again! So, $name, are you [one of the smart ogres], or have I spoken too many syllables?");
    }
  elsif($text=~/Hail/i) {
  quest::say("There really isn't much point talking above you, past you, or to you. Perhaps you should get back to banging rocks or whatever someone of your intellect does...elsewhere.");
  }
  elsif(($text=~/one of the smart ogres/i)&& ($race eq "Ogre"))  {
  quest::say("Well, I suppose your intelligence shall grow. You will have to do. I have a mission for you. First, go and speak with Grevak of the Greenblood Knights. He will have a job for you. After you have performed some manner of service and advanced at least 5 ranks, return to me and ask me about my [secret mission].");
    }
  elsif(($text=~/secret mission/i) && ($faction < 5) && ($ulevel >= 5)){
  quest::say("I have heard of your advancements. You are a fine addition to Oggok. I require your skill in handling a delicate matter. I want you to run out to the Bouncer's keep near the entrance to Oggok. There. you shall find a froglok Emissary Glib. He will pose no threat to you. He has come on business and I have promised him protection. Tell him the Greenblood shaman sent you. He shall fill you in. Go at once."); 
    }
  elsif ($text=~/secret mission/i) {
  quest::emote("rolls her eyes.");
  quest::say("I was afraid of that. I apparently spoke with large words when I said, '...after you have performed some manner of service and advanced at least 5 ranks, return to me.'  Now go ponder this as best you can, or failing at that, go see Grevak for work.");
  }
  elsif(($text=~/where is Emissary Glib/i) && ($faction < 5) && ($ulevel >= 5)){
quest::say("He awaits you at the top of the keep near the exit to the Feerrott, but go quickly, as he must return to his other work."); 
    }
  
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 18884 => 1)) { #Tattered Note
     quest::summonitem(1892); # Non-Container Empty Jar
     quest::say("What is this? More information? There seems to be a larger plan in the making. B'Dyn sounds like a Teir'Dal name. I do not like the sound of this. You must go quickly to North Ro. Find this Dark Elf. Find out what he knows...any way you can.");
     quest::faction(295,20); #Shaman of War (Ogre Shaman guild) 
     quest::exp(8450);
     quest::summonitem(15278); #Spirit of Wolf
     quest::ding(); 
        }
   if(plugin::check_handin(\%itemcount, 17929 => 1)) { #Zimbittle's Pouch
   quest::say("Ahhh!! Good work. You are a bright one. Now let us see if you can master this spell. Learn it well and may it bring you much glory."); 
    quest::faction(295,20); #Shaman of War (Ogre Shaman guild)
    quest::summonitem(15280); #Burst of Strength 
    quest::ding();
    quest::exp(8450);
      }       
    else {
    quest::say("I can't use this right now, and frankly, it's distracting.");
    plugin::return_items(\%itemcount); 
     }
}

#END of FILE Zone:oggok  ID:49038 -- Marda 

