# no-target emperor to depop when blood/blood golem killed
#
sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::depop(162589);
    quest::depop(162580);
	quest::spawn2(162064,0,0,877,-327,400.5,193);
 }
 if ($signal == 98) {
    quest::depop(162580);
    quest::depop(162589);
	quest::spawn2(162189,0,0,877,-327,400.5,193);
 }
}
#sub EVENT_SIGNAL {
  #if ($signal == 99) {
    #quest::settimer("spawnemp",350);
  #}
#}

#sub EVENT_TIMER {
  #if ($timer eq "spawnemp") {
   # quest::spawn2(162227,0,0,$x,$y,$z,189.5);
   # quest::stoptimer("spawnemp");
   # quest::depop();
  #}
#}

# EOF zone: ssratemple ID: 162065 NPC: #Emperor_Ssraeshza

