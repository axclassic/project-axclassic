sub EVENT_SAY {
my $Stupendous = quest::saylink("Stupendous", 1);
my $needle = quest::saylink("needle", 1);
my $keys = quest::saylink("keys", 1);
  if ($text=~/Hail/i){
    quest::emote(' looks up at you. You can tell his spirit is broken. His scars speak of a severe beating.'); 
 }
  if ($text=~/scrolls/i){
    quest::say("Forget them. I believe all six scrolls lie in the Kaesora Library and that is no safe place for any explorer. The scrolls are not readable by any living person, but I came here in search of a machine which may be able to decipher them, the $Stupendous Contraption. Should you return to Cabilis, see that the Arch Duke hears of the scrolls.");
 }
  if ($text=~/Stupendous/i){
    quest::say("I have learned it was a machine tinkered by a legendary gnome. It has many uses. It lies in the slave pens of Droga. Perhaps it may be used to $decipher the Scrolls of Vok Na Zov. I have learned that it will not work without a contraption $needle. Luckily I have found one in my journeys."); 
 }
  if ($text=~/needle/i){ 
    quest::say("The contraption needle is a piece of the machine, the $Stupendous Contraption. It won't operate without it and if you want it, you're going to have to bring me the pen $keys."); 
 }
   if ($text=~/keys/i){ 
    quest::say("Pen keys!! I need the pen keys to get out of here! Find the ones who hold these keys. Bring me the key to pen number 1 and both keys to the pen gates. Do so and I shall give you the contraption $needle."); 
 }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 12708 =>1, 12712 =>1, 12713 =>1 )) {
  quest::emote(' escapes with a flash, but before he goes, he speaks');
  quest::say("At last!! The keys which shall bring me freedom! I thank you and here is the contraption needle. Good luck.");
  quest::summonitem(12714);  
 }
}


