sub EVENT_SAY
{
  if($text=~/Hail/i)
  {
    quest::say("Well met. Friend.  May I be of assistance?");
  }
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found this in a scorpian nest down in the pit. Try not to lose it this time.");
  quest::summonitem(2878);}
}

sub EVENT_ITEM
{
  # A Taruun Guild Summons
  if(plugin::check_handin(\%itemcount, 18554 => 1))
  {
    quest::setglobal("Shar_Vahl_Cit",1,5,"F");
    # Application for Citizenship
    quest::summonitem("2873");
  }

  # Notorized Application
  if(plugin::check_handin(\%itemcount, 2897 => 1)){
    quest::say("Allow me to be the first to welcome you. Accept this cloak, young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Harbin Gernawl and he will give you instruction. May the spirits of the beasts guide you and keep you safe.'");
    quest::summonitem("2878");
    quest::setglobal("Shar_Vahl_Cit",7,5,"F");
}

  #do all other handins first with the plugin, the let it do disiplines
  plugin::try_tome_handins(\%itemcount, $class, "Rogue");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155253 -- Elder_Scout_Kyth_Lar 
