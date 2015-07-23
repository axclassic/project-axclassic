#Shar Vahl - Fharra Cawfeet - created by anubisrwml

sub EVENT_SAY {
my $aid = quest::saylink("aid", 1);
my $told = quest::saylink("told", 1);
my $willing = quest::saylink("willing", 1);
if ($text=~/Hail/i){
quest::emote(' looks like she has been awake for many hours. She looks up at you.');
quest::say("Are you here to assist me with these sick citizens? I was told that a few of our newest Dar Khura recruits might be coming to $aid me. I could definitely use the help.");
}
if ($text=~/Hail/i){
quest::say("Here, take the jar while I explain. Were you $told about the tasks that I need help with?");
quest::me("The room is filled with the smell of aromatic herbs and the sweat of the feverish.");
}
if ($text=~/told/i){
quest::say("I was called to this house a few days ago, because several members of a recent scouting group have been running slight fevers. The fever is nothing that should alarm you but we will need to tend to them. Tending to the sick is one of our duties as Dar Khura. Nothing personal but I need to see some kind of proof that you are the one that was sent to help me, Insurance rates are so high now, I can't afford a law suit.");
}
if ($text=~/willing/i){
quest::say("I need you to make a tonic to help aleviate their fevers. Please head into the cavern system just beyond the thicket. Gather the hearts of muck diggers that roam those caverns. Their hearts seem to regulate the temperature of their body and can be used in potions and tonics to control temperature in a similar fashion. Brew two of those hearts with a flask of water and it should produce the tonic I need. Please, fill the blackened clay jar with tonic. Try to make it back before I fall over from exhaustion."); }
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 3495 => 1)) {
quest::emote("I see, thank you. Would you be $willing to run some errands for me? I cannot leave these scouts unattended.");
quest::summonitem(3495);
quest::summonitem(17077); }

if (plugin::check_handin(\%itemcount, 5536 => 1)) {
quest::emote(' perks up when you hand her the jar.');
quest::say("Many thanks!");
quest::emote(' digs in her medicine bag.');
quest::say("Your assistance is greatly appreciated. Please take this tincture. It will help to strengthen your buckler. Mydi Darjik can help you apply it. She is a friend and a wonderful alchemist. Tell her that you need her to $treat your buckler. Take care, $name!");
quest::summonitem(5537); 
}
else {
plugin::return_items(\%itemcount);
}
}
