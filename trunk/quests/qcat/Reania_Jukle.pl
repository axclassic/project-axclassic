# Ink of the Dark portion of enchanter epic quest lead-in
# 


sub EVENT_SAY {
  if ($text=~/Hail/i) {
   quest::say("Why are you talking to me? Don't you know where you are? I can either turn you into a hideous thing or just call the guards and let them take into the next life! Unless you have something for me I suggest you run for your life!");  
  if ($text=~/ink/i) {
    quest::say("Ink of the Dark, you say? That isn't an everyday item, you know. In fact, I can't remember the last time someone requested it. I have given up keeping any here with me. You are going to need to find your own supply now. Sorry.");
  }
  elsif ($text=~/where/i) {
    quest::say("The ink is the blood of a dark scribe. Tempt him and give him this vial. He should cooperate.");
    quest::summonitem(10626);
  }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18851 => 1) && $class eq "Enchanter") { 
   quest::say("So you think you are a Bloodsaber eh? Well he is your robe, Mind you many outside our order won't understand you and will think the world would be better off without you in it. Be careful where you go and who you talk to young recruit.");
   quest::summonitem(13562);
   quest::ding();
   quest::faction(282,10);
   quest::faction(193,10);
   quest::faction(282,10);
   quest::faction(193,-10);
   quest::faction(193,-10);
   quest::exp(1000);
   }
 else {
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Enchanter');
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }  

# EOF Zone: qcat ID: 45082 NPC: Reania_Jukle

