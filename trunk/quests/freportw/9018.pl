##############################
##    Replacement PL for    ##
##    Sir Lucan  D'Lere     ##
##    Created By Aardil     ##
##       11-24-2013         ##
##############################
sub EVENT_SAY
{ 
if($text=~/Hail/i && $class eq "Warrior")
{
quest::say("Hello, I am the Warrior Guild Master of Freeport and I am here to train you. Lets get started.");
}
elsif($text =~ /Hail/i && $class eq "Paladin", "Ranger", "Druid", "Cleric", "Berserker", "Bard", "Magician", "Shadowknight", "Necromancer". "Rogue", "Beastlord", "Enchanter", "Monk", "Shaman", "Wizard") {
	quest::say("Be gone! You are not a Warrior and I have no reason to listen to you. Leave now or I will dispatch you myself!");
}
sub EVENT_ATTACK
{
quest::say("Let your death be a warning to all who dare oppose the Freeport Militia!");
quest::say("Die. dog!!"); }
}

sub EVENT_DEATH  {
my $a = quest::ChooseRandom(9162);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
 quest::spawn2($a,0,0,$x,$y,$z,$h);
 quest::say("You shall never get my testimony. I shall fight you from the grave!! Ha Ha Ha!! You cannot stop the undead!! Foolish mortal!! Your foul deeds have earned my contempt. ");
}
sub EVENT_ITEM
{
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9018 -- #Sir_Lucan_D`Lere