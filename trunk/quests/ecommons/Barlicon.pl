##########################Barlicon EC TUNNEL NPC##########################
####Developed by Romell
####Date 04.14.09
##items FBR 1320, BTSR 13400
sub EVENT_SPAWN

{
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();


 quest::set_proximity( $x-40,$x+40,$y-40,$y+40,$z-40,$z+40);
 
} 

sub EVENT_ENTER
{
  quest::shout("WTS FBR for 150pp and BTSR for 100pp");

}

sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hi, $name=) WTS [FBR] for 150pp and [BTSR] for 100pp. [interested]?"); 
 }

if ($text =~/fbr/i)
 {
quest::say ("Flowing Black Robe, Drops off Najena");
quest::itemlink(1320);
 }
if ($text =~/btsr/i)
 {
quest::say ("Black Tome with Silver Runes, also off of Najena");
quest::itemlink(13400);
 }
if ($text =~/interested/i)
 {
quest::say ("Cool, Hand me the cash and their yours!");
 }
}

sub EVENT_ITEM
{
#PC Purchase
if($platinum == 150)
{
quest::say ("Decent robe for a decent price, Enjoy.");
quest::summonitem("1320");
}
elsif($platinum == 100)
{
quest::say ("Have a nice big book, later.");
quest::summonitem("13400");
}
else {
plugin::return_items(\%itemcount);
quest::say("No thank you.");
}
}

