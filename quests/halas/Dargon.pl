sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello there, $name.  Can I interest you in any components to help you in your research?");
  }
  if($text=~/Arantir/i) {
    quest::say("There is no fooling you $name");
	quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
    quest::depop();
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14331 => 1)) { #Ro's Breath
    quest::say("So, I've been discovered! You must know Camin - he is one of the only people who could have recognized my work. I have worked very hard to mask my presence here.");
    quest::unique_spawn(29089,0,0,$x,$y,$z,$h);
    quest::depop();
    }
  }

#END of FILE Zone:halas  ID:29000 -- Dargon 

