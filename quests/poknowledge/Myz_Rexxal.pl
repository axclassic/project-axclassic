## Resqu Mipliz ##
## Betrayal Armor Quest ##
## Part 1 Lead you into Betrayal ##
## 4/18/2013 ##


sub EVENT_SAY{
my $betrayal = quest::saylink("Betrayal", 1);
my $back = quest::saylink("back",1);
my $necklace = quest::saylink("necklace", 1);
my $assist = quest::saylink("assist",1);

if ($text =~ /hail/i && $faction < 5){
 $client->Message(14,"What's wrong $name , my sister is crazy. I am sorry she sent you to $betrayal.");
  }	
if ($text=~/betrayal/i && $faction < 5) {
    $client->Message(14,"Yes, I know it is dangerous why do you think I did not go to her. Would you like to go $back?");
}
if ($text=~/back/i && $faction < 5) {
    $client->Message(14,"Ok, remember it was your choice!");
    quest::movepc(277,-188,288,7,000);
    return 1;
}
if ($text =~ /hail/i && $ulevel >= 65){
 $client->Message(14,"Hello $name , I worry for my sister. She wonders the Tranquility along the shore. I wish to give her a $necklace, to help her over this strange time.");
}	
if ($text=~/necklace/i && $ulevel >= 65) {
    $client->Message(14,"I am just way to busy to do it. Prehaps you would $assist me in this matter. You know with my graditude.");
}
if ($text=~/assist/i && $ulevel >= 65) {
    $client->Message(14,"Wonderful I am sure she will snap out of it once she gets it.");
    quest::summonitem(119783);
    quest::exp(5000);
    return 1;
}
else {

        plugin::return_items(\%itemcount);
	    return 1;
}
}



