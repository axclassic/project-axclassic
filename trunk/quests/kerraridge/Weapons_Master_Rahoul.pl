sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $bit = quest::saylink("bit", 1); 
my $Elder = quest::saylink("Elder", 1);
my $items = quest::saylink("items", 1);
my $padding = quest::saylink("padding", 1); 
my $Gems = quest::saylink("Gems", 1);
my $Acrylia = quest::saylink("Acrylia", 1);
if($text=~/Hail/i){
quest::say("Hail friend, are you a $new recruit or have you been at it for a $bit or were you sent to me by $Elder Animist Dumul?");
}
if($text=~/new/i){
quest::say("Well... perhaps you should head to the combat training grounds and pick up a few pointers.  Walk west along the ledge that runs just outside of the city's walls and you shouldn't be able to miss it.");
}
if($text=~/bit/i){
quest::say("Good good... keep at it!  We need all of the strong willed thick headed Khala Dun we can muster!  Now, get back to the fight!"); 
}
if($text=~/Elder/i){
quest::say("You are just the time. The weapon that Elder Dumul requested has almost been completed. We need you to gather a few $items in order to complete the weapon. These items will not require much effort to acquire, but I will need to tell you where to look. Place all of the items that I request in this box and return it to me as quickly as possible."); 
quest::summonitem(17363);
} 
if($text=~/items/i) {
quest::say("I need the following items to complete the weapon. A chunk of dense fungal $padding, two $Gems of the Void and Perfect $Acrylia Ore. Once I have those items, I can finish the weapon that you will need to use to kill the dark animist.");
}
if($text=~/padding/i)  {
quest::say("'When traversing the Deep, you will run across a shrieking fungus. Those creatures are much more durable and dangerous than the other fungi that you may encounter in the caverns of Luclin. It is for this reason that we use their flesh as padding. Take care when hunting them, for they will provide a good challenge.");
}
if($text=~/Gems/i)  {
quest::say("If you look in the Maiden's Eye, you will find entities that are the embodiment of darkness. Their twisted spirits are not allowed to escape the form that they inhabit. They have no hope of escape, unless they are released during the destruction of their material form. There are some occasions when the power that is used to keep them in this realm will turn upon itself during this period of destruction. This process is what produces the Gems of the Void."); 
}
if($text=~/Acrylia/i)  {
quest::say("The ore that I require is often used to create living rock formations. These collections of rocks and boulders will often leave a trail of energy that causes other rocks to collect and come to life. Our scouts have seen these formations in a variety of areas. Take care when you attempt to gather this ore.");
quest::say("Now, seek out a large chunk of perfect acrylia ore, two Gems of the Void, and chunk of dense fungal padding. Once I have those items, I can finish the weapon that you will need to use to kill the dark animist.");
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9060 =>1 )) {
    quest::say("These claws should work well for you. The design was research by Historian Qua. They should work to neutralize the magical field that protects the dark animist and allow you to tear his scaly flesh from his frame. Remember that all of this is theoretical. Those claws are an original creation. You will be the first to prove their effectiveness in combat.");
    quest::summonitem(9055);
    quest::summonitem(9056);
	quest::say("Take the claws back to Animist Dumul and show him their design. Use them well, $name. May the spirits guide you in your attack."); 
   }
}   
#END of FILE Zone:Kerra Ridge  ID:74440 -- Weapons_Master_Rahoul 

