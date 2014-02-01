   sub EVENT_SPAWN
{
   quest::delglobal("toxgrd");
   quest::setglobal("toxgrd",2,3,"F");
   $toxgrd=undef;
}

sub EVENT_ITEM {
my $owner = $npc->GetOwnerID();
if ($owner > 0) {
}else {
plugin::return_items(\%itemcount);
}}
