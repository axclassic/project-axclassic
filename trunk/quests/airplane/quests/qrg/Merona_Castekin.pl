######################################
## NPC: Merona_Castekin             ##
## Zone: Surefall Glade (qrg)       ##
## Quest: Mini Cash Quest           ##
## Revised by caved for AXClassic   ##
## EQWorld Server     18-12-2010    ##
######################################
sub EVENT_SAY {
my $brother = quest::saylink("brother", 1);
    if($text=~/Hail/i) {
	   $client->Message(14,"Oh, hello! Welcome to Surefall Glade. Are you planning a trip to Qeynos? If you are, I could use some help finding my $brother.");
    }
    if($text=~/brother/i) {
	     $client->Message(14,"My brother Ronn went to Qeynos several days ago for supplies. He was just going to Sneed's and back. But he hasn't been seen since. I can't leave the Glade because the Sabertooths could attack at any minute. Could you please find out what happened to my brother? Ask Sneed about Ronn Castekin");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,18014=>1)) {
     $client->Message(14,"Oh Tunare why!?!? Those foul Bloodsabers will pay for my brother's death!! Here. You have given us valuable information about a new threat to our homes. Take this a token of our appreciation.");
     quest::faction(265,10);
     quest::faction(159,10);
     quest::faction(279,-30);
     quest::faction(135,10);
     quest::ding(); quest::exp(1000);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
  }
  else {
     $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
     plugin::return_items(\%itemcount);
     plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
     return 1;
  }
}