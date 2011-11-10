#############
#NPC: Bruno_Barstomper
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Sunsa_Jocub, Trumpy_Irontoe
#Items Involved: 
#zone: qeynos

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings, $name.  Welcome to Fish's Ale.  Have fun but watch your step.  We get a rough crowd in here and I would hate to have to bust your head in if you started trouble.");
  }
}

sub EVENT_SIGNAL {
  #response to Trumpy_Irontoe
  if ($signal == 1) {
    quest::say("Yeah. Yeah. I hope you fall in, you little creep.");
  }
}

#END of FILE Zone:qeynos  ID:1075 -- Bruno_Barstomper 

