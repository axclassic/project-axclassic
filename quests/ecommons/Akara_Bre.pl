##########################Akara Bre EC TUNNEL NPC##########################
####Developed by Romell
####Date 04.14.09
##items PGT 5360, CDS 9309, Charred Boots 4307

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
  quest::shout("Selling a PGT for 70pp also selling CDS for 100pp and Charred Boots for 80pp.");

}

sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Hey there $name. [Interested] in anything im selling? [PGT] for 70pp, [CDS] for 100pp or [Charred Boots] for 80pp?."); 
 }

if ($text =~/pgt/i)
 {
quest::say ("That would be a Polished Granite Tomahawk");
quest::itemlink(5360);
 }
if ($text =~/cds/i)
 {
quest::say ("Cracked Darkwood Shield");
quest::itemlink(9309);
 }
if ($text =~/charred boots/i)
 {
quest::say ("Charred Boots from SolA.");
quest::itemlink(4307);
 }
if ($text =~/interested/i)
 {
quest::say ("Awesome, been here all day lol. Hand me the cash for what you want.");
 }
}

sub EVENT_ITEM
{
#PC Purchase
if($platinum == 70)
{
quest::say ("Fun axe, has a nice proc.");
quest::summonitem("5360");
}
elsif($platinum == 100)
{
quest::say ("Enjoy the shield.");
quest::summonitem("9309");
}
elsif($platinum == 80)
{
quest::say ("Pretty nice boots, Cya later..");
quest::summonitem("4307");
}
else {
plugin::return_items(\%itemcount);
quest::say("No thank you.");
}
}

