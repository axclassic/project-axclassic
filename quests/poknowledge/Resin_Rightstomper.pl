# Quest Name: The Fabled Coldain Ring War  #
# Based on input from Rightman and 10th coldain ring #
# Author: Resqu Miplez #
# Axclassic Rathe Server #
# test script 1.0 # 

sub EVENT_SAY{
my $join = quest::saylink("join", 1);

if($text =~ /complete/i){
	quest::delglobal("greatdivide");
}
if($text =~ /hail/i && !defined($qglobals{"greatdivide"})){
	$client->Message(14,"Greetings. The giants have put together a vast army to attack Thurgadin. This may be the most difficult battle in the history of Velious. Can you come to our aid? Show me proof that you have killed Giants before by giving me three Giant Warrior Helmets and a Velium Weapon and I will enlist you and whoever you bring to fight them.");
}
  if ($text=~/hail/i && defined($qglobals{"greatdivide"})) {
    $client->Message(14,"Your friends are ready to battle for Thurgadin. Are you willing to $join?");
}
  if ($text=~/join/i) {
   if (defined($qglobals{"greatdivide"})) {
     $client->Message(14,"You may join your friends in battle!");
     my $QGlobalValue = $qglobals{"greatdivide"};
     quest::MovePCInstance(118, $QGlobalValue, -965,-7720,-557);
}
}
}

sub EVENT_ITEM{
if((plugin::check_handin(\%itemcount, 29062 => 3, 30200 => 1)) ||#Velium Long Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30201 => 1)) ||#Velium Two Handed Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30202 => 1)) ||#Velium Short Sword 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30203 => 1)) ||#Velium Scimitar 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30204 => 1)) ||# Velium Warhammer 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30205 => 1)) ||# Velium Morning Star 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30206 => 1)) ||# Velium Great Staff 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30207 => 1)) ||#Velium Dagger 
         (plugin::check_handin(\%itemcount, 29062 => 3, 30208 => 1)) ||#Velium Spear
         (plugin::check_handin(\%itemcount, 29062 => 3, 30209 => 1)))# Velium Rapier
      {
    $client->Message(14,"Thank you $class , you are on the way to fight the war, good luck!"); #Instance creation and porting to it.

    my $instanceID = quest::CreateInstance("greatdivide", 0, 46800);
    quest::AssignToInstance($instanceID);
    quest::setglobal("greatdivide",$instanceID,7,H13);
    quest::MovePCInstance(118, $instanceID,-965,-7720,-557);
return 1;
 }

else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}

