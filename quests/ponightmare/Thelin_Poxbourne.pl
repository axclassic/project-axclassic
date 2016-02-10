## NPC: Thelin_Poxbourne                 
## Zone: Plane of Nightmare               
## by Aardil
## January 31st, 2016
## 2nd revision and cleanup by patrik
## associated with Adroha_Jezith.pl in poTranquility

sub EVENT_SAY {
my $dagger = quest::saylink("dagger", 1);
my $help = quest::saylink("help", 1);
my $ready = quest::saylink("ready", 1);

  if ($text=~/Hail/i && $qglobals{"Thelin"} == 1) {
  quest::say("Who is it? Are you.. really there? You are! Please I beg of you to help me escape from this horrid place. Terris Thule
  is holding me here, she delights in the nightmares she sends me. To further torture me, she has offered me a pact. She has said that
  if I can retrieve my $dagger, then I am free to go. She does this only because she knows that I cannot retrieve it on my own.");
  quest::delglobal("Thelin");
  quest::setglobal("Tdagger", 1, 5, "S30"); #gives you 30 seconds to trigger next response and deletes Thelin Global
   }
 elsif ($text=~/Hail/i && $qglobals{"Tthule"} == 1) {
  quest::say("Good to see you again $name. Finish that Vile Terris Thule for me and end this nightmare");
  quest::movepc(221,1655.3,25.8,-338.7); 
  }
 elsif ($text=~/dagger/i && $qglobals{"Tdagger"} == 1) {
  quest::say("She has taken the only thing that has brought me any joy in my life. She took it and broke it into seven pieces.
  She placed them deep within the labyrinth of my nightmare. I must retrieve it, will you $help me. Please I beg of your mercy.");
  quest::delglobal("Tdagger");
  quest::setglobal("Thelp", 1, 5, "S30"); #gives you 30 seconds to trigger next response and deletes Tdagger Global
 
  }
 elsif ($text=~/help/i && $qglobals{"Thelp"} == 1) {
  quest::say("I do not know who you are, but I am thankful that you have stumbled upon me. I can bring you into my dream state. Please when you are prepared tell me they are $ready.");
  quest::delglobal("Thelp");
  quest::setglobal("Tready", 1, 5, "M10"); #gives you 10 minutes to form up your 18 bot raid and trigger next response and deletes Thelp Global 
 
  }
 elsif ($text=~/ready/i && $qglobals{"Tready"} == 1) {
   $npc->SetAppearance(3);#sleeping
  quest::emote("  closes his eyes and falls asleep immediately. He looks peaceful for a moment and then screams in agony!");
  quest::delglobal("Tready");
  quest::setglobal("Tmaze", 1, 5, "M5"); #gives you 5 Minutes to zone and hail Thelin instance zone
  quest::settimer("sleeptimer",10);
  quest::movepc(221,1655.3,25.8,-338.7);
 
  }
  elsif (!defined $qglobals{"Thelin"} || !defined $qglobals{"Tdagger"} || !defined $qglobals{"Thelp"} || !defined $qglobals{"Tready"} || !defined $qglobals{"Tthule"}) { #If hailed before Adorha OR any of the subsequent continuations were not Hailed in time this happens
   
   quest::emote(" screams loudly, and then falls asleep once again.");
   quest::settimer("sleeptimer",10);
   $npc->SetAppearance(3);#sleeping
   quest::depop();
  }
  else {
   #Do nothing for now
   }
}#End sub EVENT_SAY

sub EVENT_TIMER {
   if($timer eq "sleeptimer"){
      quest::stoptimer("sleeptimer");
      quest::depop();
   }
}

#END OF FILE Zone:Plane of Nightmare ID:204047 -- Thelin_Poxbourne.pl
