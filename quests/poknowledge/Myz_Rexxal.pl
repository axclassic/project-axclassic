## Resqu Mipliz ##
## Betrayal Armor Quest ##
## Part 1 Lead you into Betrayal ##
## 4/13/2013 ##

sub EVENT_SAY{
my $necklace = quest::saylink("necklace", 1);
my $assist = quest::saylink("assist",1);

 if ($text =~ /Hail/i && $ulevel = 65){
 $client->Message(14,"Hello $name , I worry for my sister. She wonders the Tranquility along the shore. I wish to give her a $necklace, to help her over this strange time.");
  }	
if ($text=~/necklace/i && $ulevel = 65) {
    $client->Message(14,"I am just way to busy to do it. Prehaps you would $assist me in this matter. You know with my graditude.");
}
if ($text=~/assist/i && $ulevel = 65) {
    $client->Message(14,"Wonderful I am sure she will snap out of it once she gets it.");
    quest::summonitem(119783);
    quest::exp(5000);
    return 1;
}
else {
        $client->Message(14,"Begone with you. I am to busy for idle chit chat.");
        plugin::return_items(\%itemcount);
	    return 1;
}
}


