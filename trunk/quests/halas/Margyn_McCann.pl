sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. young adventurer!  I'm the chief overseer o' the Shamans o' Justice. We serve the will o' the Tribunal. Justice is our way. Within Halas. there are none who are above the scales o' justice. There are still some who have defied our laws. We wish to [apprehend the fugitives].");
}
if($text=~/i will apprehend the fugitives/i){
quest::say("Maybe so. however. there are some who may be too much fer ye to handle.I'll need to know if ye're a [young shaman] or a [standin' member of the court].");
}
if($text=~/i am a young shaman/i){
quest::say("We seek a former member who dared to curse the righteousness of the Tribunal. We'll have his head for that remark. His name is Granin O'Gill and he has run to the wastelands of Everfrost seeking safe haven. Find him. Return his head to me. Do so. and earn the ninth circle spell. Spirit o' the Bear. Go at once!");
}
if($text=~/I am a standing member of the court/i){
quest::say("At the moment. I've no word o' heretics about for ye to hunt down. I pray that there will be no more. too!"); }
}
sub EVENT_ITEM { 
   #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shaman');
 if($itemcount{18761} == 1){
    quest::say("Ah another recruit. Well then, take this apprentice tunic and wear it with pride. There is much work to do. return to me when you need training. Bring pride to the name of the Storm Guards");  #made up text
	quest::summonitem(13512);
	quest::ding();
	quest::faction(213, 10);    #merchants of halas
    quest::faction(294, 10); 	#shamans of justice
    quest::exp(500);
 }
elsif(plugin::check_handin(\%itemcount, 13069 => 1))	{ 
    quest::say("Fine work! You are on your way to becoming an adequate combatant.");
    quest::summonitem(15279); #spell: Spirit of the Bear
	quest::ding();
	quest::faction(213, 10);    #merchants of halas
    quest::faction(294, 10); 	#shamans of justice
    quest::faction(33, -10);  #circle of unseen hands
    quest::faction(47, -10);  #coalition of tradefolks
    quest::faction(48, -10);  #coalition of tradefolks underground
    quest::faction(137, -10);  #hall of the ebon mask
    quest::exp(1000);
  }
  else {
  quest::say("I have no need of this, take it back.");
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:halas  ID:29059 -- Margyn_McCann 

