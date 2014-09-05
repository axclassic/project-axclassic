sub EVENT_SAY {
my $Pass = quest::saylink("passing through", 1);
if($text=~/Hail/i){
quest::say("Hail traveler. may I assist you with something. or are you just $Pass?");
}
if($text=~/passing through/i){
quest::say("Very well friend. please take care when passing beyond the river to the east.  Several researchers and their mercenary escort passed through our camp en route to the temple.  That was last week and they have yet to return.  We are holding off on our expedition until we can learn more about what happened to them."); }
}
#END of FILE Zone:feerrott  ID:47132 -- Aqaar_Aluram 

