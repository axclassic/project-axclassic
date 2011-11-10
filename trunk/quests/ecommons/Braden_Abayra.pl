##########################Bradan Abayra EC TUNNEL NPC##########################
####Developed by Romell
####Date 04.14.09
# items manastone 13401, PKT 10335, GBS 10404

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
  quest::shout("WTT a PKT for a Manastone. Also WTS a GBS for 1000pp.");

}

sub EVENT_SAY
{


if ($text =~/hail/i)
 {
quest::say ("Hey, $name. I WTT a [PKT] for a [Manastone]. Also selling a [GBS] for 1000pp [Interested]?");
 }
if ($text =~/pkt/i)
 {
quest::say ("Pearl Kedge Totem, Drops off Bilge.");
quest::itemlink(10335);
 }
if ($text =~/gbs/i)
 {
quest::say ("Glowing Black Stone, It's super rare. Camped it for like 100 hours, worse than jboots lol");
quest::itemlink(10404);
 }
if ($text =~/manastone/i)
 {
quest::say ("It's very rare. Off the Evil Eye in LGuk");
quest::itemlink(13401);
 }
if ($text =~/interested/i)
 {
quest::say ("Cool, hand me the Manastone or 1000pp");
 }
}

sub EVENT_ITEM
{
#trade-ins

if($itemcount{13401} == 1)
   {
quest::say ("Enjoy the Totem $name, It's a rare piece.");
quest::summonitem("10335");
	}

#PC Purchase
elsif($platinum == 1000)
   {
quest::say("Awesome! I camped this forever and now it has paid off! Thanks.");
quest::summonitem("10404"); 
   }

else {
plugin::return_items(\%itemcount);
quest::say("I can't take something for nothing.");
}
}
