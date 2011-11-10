## Global Npc PL
## Angelox

sub EVENT_ITEM {
my $owner = $npc->GetOwnerID();
if ($owner > 0) {
}else {
plugin::return_items(\%itemcount);
}}

