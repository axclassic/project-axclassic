sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to our kitchen! As you can tell we stay pretty busy in here.  There are a lot of people to feed and a vast number of delicious meals to feed them.  I'm in charge of preparing stews. broth. and vegetables.  If you ever have any questions about those areas. please let me know."); }
}
sub EVENT_ITEM { 
if($itemcount{10390} == 4){
quest::summonitem("30580");
quest::givecash("3","2","0","0"); }
}
#END of FILE Zone:sharvahl  ID:155210 -- Cook_Yalkiin 

