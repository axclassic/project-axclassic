sub EVENT_SAY {
  if (($text=~/hail/i) && ($class eq "Monk")) {
   quest::emote('shows awareness of you, but ignores you completely.'); 
}
  if (($text=~/peace/i) && ($class eq "Monk")) {
   quest::emote('begins to speak to you without movement of his rotted mouth, you realize his words are pouring into your mind.');
   quest::say("You seek peace of mind, and may you have it. First though, your Shackle of Steel. One Shackle for one tome."); 
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 4196 => 1) && $class eq "Monk") {
   quest::emote('drops a tattered tome at your feet and says nothing more.'); 
   my @itemt = (18359,18462,18463,18464,18465,18466,18467,18468,18469,18470);
   my $total0 = 0;
   foreach my $xxitem (@itemt) {
   $total0 += $itemcount{$xxitem};
   }; 
   quest::depop();
 }
}