sub EVENT_SAY { 
    if($text=~/Hail/i){
     quest::say("Good day $name. or is it evening already? I can never tell. Stock up on goods while you're here and if you see any grimlings. please. make them suffer. My husband was tortured by the grunts in the forest.");
     }
}
sub EVENT_ITEM {
my $weapon = quest::saylink("weapon", 1);
    if(plugin::check_handin(\%itemcount,5573 =>1 )){
     quest::say("Well, look at you! You're quite the hunter. Not a bad job at all, young citizen. We can sure use a few more like you. I think a little padding of your daily report is in order considering the amount of work that you've done for us. Take this back to citizen Miann. She'll be pleased with you. I wrote it up pretty nice for you. Take care and good luck with your training.");
     quest::summonitem(5577);
     }
}
#END of FILE Zone:hollowshade  ID:166009 -- Rittuh_Purrik 


