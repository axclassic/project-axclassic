## Betrayal Armor Quest ##
## Part 4 Lead you to Hate ##
## 4/13/2013 ##

sub EVENT_SAY{
	if ($text =~ /hail/i){
	quest::say("Shh the master does not know I am here so leave before you give me away and we both die.");
	}
	elsif ($text =~ /box/i){
	quest::say("Why should I just give you that information. If ypu want it that bad then pay up 1000K then I will tell you.");
	}
	else{
	quest::say("Beat it or we both are done for.");
	}
}


sub EVENT_ITEM {
  
if (($platinum=>1000)&&($ulevel>= 65)){
	quest::say("Hmmff, Ok then. This will do nicely. Pay attention I will only say this once. You'll have to pay to here it again. The box is crafted from the wood that only storms and nightmares can bring you. Eight in total split right down the middle. That wood is to be worked just as you would metal. Then go find Menk in the place of all knowledge.");
}
elsif($platinum>= 1001) {
	quest::say("Good, I will always take some extra cash.");
      }
else {
     if(($cash < 1000000) &&  ($cash > 0)) {
        quest::say("You make me laugh. I can be bribed but it will take more then that.");
        quest::givecash($copper,$silver,$gold,$platinum); #Return money
        }
     }


