sub EVENT_SAY {
my $taken = quest::saylink("taken", 1);
  if ($text=~/Hail/i){
    quest::say("Bring to me that which was $taken.");
	}
  if ($text=~/taken/i){
    quest::say("Search the Emerald jungle, a tome raider has what is needed, common it is not.");
	quest::say("Then you must speak with Dom K'Perl. all I know is his sprit speaks to me from the Overthere. More I will not say.");
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18069 =>1, 18068 =>1 )) {	
   quest::say("All must be returned!");
   quest::emote('fades out of existence. The air smells of death. Something has appeared in your hand.');
   quest::summonitem(12889); 
   quest::depop();
  }
}  
