sub EVENT_SAY {
my $more = quest::saylink("more", 1);
  if ($text=~/hail/i) {
  quest::say("Hello there yourself! If you don't mind I am quite busy here studying the rocks of this region."); 
  }
  if ($text=~/dark/i) {
  quest::say("Well it slowly poisons the owner's mind eventually killing them. But it doesn't end at that, there's $more.");
 }
   if ($text=~/more/i) {
   quest::say("Yes. . .I'm afraid it also traps the soul of the owner in the stone. I cannot perform the ritual any longer but I believe there is another that may be able to. I'm sorry I don't remember where to find him but you can ask around for him if you can't find him. His name is Liyx. Take your stone and find him. You will need it to summon the spirit to finally put him to rest properly."); 
   quest::summonitem(45033);
 }
}
sub EVENT_ITEM {
my $dark = quest::saylink("dark", 1);
  if (plugin::check_handin(\%itemcount, 48029 => 1)) {
  quest::say("Where did you find this? Never mind that, it doesn't matter. I hope you didn't have it for long. This stone has the power to drain the soul of the owner. In its pure form it can remove curses from creatures, but the one you have has been used already. In its $dark form it does far worse."); 
  quest::summonitem(12478);
  quest::faction( 30,2);
  quest::faction( 193,2);
  quest::faction( 282,2);
  quest::faction( 317,2);
  quest::faction( 62,2);
  quest::ding();
  quest::exp(4000);
  }
}
