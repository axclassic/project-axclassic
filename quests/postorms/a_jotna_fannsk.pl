### PoS Krendic Event
### Angelox
### Still at it!

sub EVENT_SPAWN {
if (($krendic > 0) && ($krendic < 12)){
 quest::delglobal("krendic");
 quest::setglobal("krendic",0,7,"F");
 $krendic=undef;}
 }

sub EVENT_DEATH {
if ($krendic==0){
 quest::delglobal("krendic");
 quest::setglobal("krendic",1,7,"F");
 $krendic=undef;}
elsif ($krendic==1){
 quest::delglobal("krendic");
 quest::setglobal("krendic",2,7,"F");
 $krendic=undef;}
elsif ($krendic==2){
 quest::delglobal("krendic");
 quest::setglobal("krendic",3,7,"F");
 $krendic=undef;}
elsif ($krendic==3){
 quest::delglobal("krendic");
 quest::setglobal("krendic",4,7,"F");
 $krendic=undef;}
elsif ($krendic==4){
 quest::delglobal("krendic");
 quest::setglobal("krendic",5,7,"F");
 $krendic=undef;}
elsif ($krendic==5){
 quest::delglobal("krendic");
 quest::setglobal("krendic",6,7,"F");
 $krendic=undef;}
elsif ($krendic==6){
 quest::delglobal("krendic");
 quest::setglobal("krendic",7,7,"F");
 $krendic=undef;}
elsif ($krendic==7){
 quest::delglobal("krendic");
 quest::setglobal("krendic",8,7,"F");
 $krendic=undef;}
elsif ($krendic==8){
 quest::delglobal("krendic");
 quest::setglobal("krendic",9,7,"F");
 $krendic=undef;}
elsif ($krendic==9){
 quest::delglobal("krendic");
 quest::setglobal("krendic",10,7,"F");
 $krendic=undef;}
elsif ($krendic==10){
 quest::signal(210081,0);
 quest::delglobal("krendic");
 quest::setglobal("krendic",11,7,"F");
 $krendic=undef;}
}
