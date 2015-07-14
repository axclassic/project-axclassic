sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to our kitchen! As you can tell we stay pretty busy in here.  There are a lot of people to feed and a vast number of delicious meals to feed them.  I'm in charge of preparing stews. broth. and vegetables.  If you ever have any questions about those areas. please let me know."); 
}
}

sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 10390 == 4)){
quest::summonitem(30580);
quest::givecash(3,2,0,0); 
}
elsif(plugin::check_handin(\%itemcount, 5559 => 1)) {
quest::say("I'd love to fill this order, but we're out of the meat that he likes. We've been very busy today, so I doubt that any of us will be able to get out to gather more of it. If you could go out and grab us a few slabs, we could not only fill the order, I could put some away for anyone else that may come through today. This sounds like a perfect task for a young Taruun recruit. Fill this sack with the fatty meat from a young Owlbear and bring it back to me right away. I'll get Joharr's sandwiches as soon as you return with the meat.");
quest::summonitem(17608);
}
elsif(plugin::check_handin(\%itemcount, 5562 => 1)) {
quest::emote(' opens the bag and immediately begins to slice the meat into thin sheets. He throws the meat on a few slices of bread and wraps the whole thing up with a hand full of vegetables.');
quest::say("Here you go, friend!");
quest::emote(' hands you what appears to be a lunch bag.');
quest::say("Joharr should love these sandwiches! The meat that you brought us was great. If you ever need a job as a butcher, just let us know. Take care and tell Joharr I said hello.");
quest::summonitem(5563);
quest::ding();
quest::faction(132, 10);
quest::faction(175, 10);
quest::exp(10000);
}
else{
plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:sharvahl  ID:155210 -- Cook_Yalkiin 

