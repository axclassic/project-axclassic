##########################Mistabone Hagg EC TUNNEL NPC##########################
####Developed by Romell
####Date 04.14.09
##items yak 5500, SSB 4301, moonstone 10150

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
  quest::shout("Selling a Yak for 500pp also selling SSB for 100pp and moonstone rings for 50pp ea.");

}

sub EVENT_SAY
{

if ($text =~/hail/i)
 {
quest::say ("Sup, $name. Selling a [Yak] for 500pp also selling [SSB] for 100pp and [moonstone] rings for 50pp ea. You [interested]?"); 
 }

if ($text =~/yak/i)
 {
quest::say ("Shortsword of Ykesha, Drops off the Ghoul Lord in Lower Guk");
quest::itemlink(5500);
 }
if ($text =~/ssb/i)
 {
quest::say ("Skull-shaped Barbute, its the Ghoul Lord's Common Drop. Yeah, I camp him a lot");
quest::itemlink(4301);
 }
if ($text =~/moonstone/i)
 {
quest::say ("Common drop off the Frenzied Ghoul in LGuk, FBSS is the rare.");
quest::itemlink(10150);
 }
if ($text =~/interested/i)
 {
quest::say ("Cool, Hand me the cash and we're golden");
 }
}

sub EVENT_ITEM
{
#PC Purchase
if($platinum == 500)
{
quest::say ("It's a real nice sword. Doesn't drop a lot.");
quest::summonitem("5500");
}
elsif($platinum == 100)
{
quest::say ("It's a decent pre-planes Helm, enjoy.");
quest::summonitem("4301");
}
elsif($platinum == 50)
{
quest::say ("It seems to be the only thing FG ever drops.");
quest::summonitem("10150");
}
else {
plugin::return_items(\%itemcount);
quest::say("Not accepting vendor trash at this time, k thx.");
}
}

