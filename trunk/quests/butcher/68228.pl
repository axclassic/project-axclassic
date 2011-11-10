## SirensBane travels from butcher to oot to freporte and back
## Angelox
## Qadar

sub EVENT_DEATH {
  if ($sirens < 14){
    quest::delglobal("sirens");
    quest::setglobal("sirens",14,0,"F");
  }
}

sub EVENT_WAYPOINT {
## In Butcher > Oot ########################### In Butcher > Oot ###########
if (($sirens==0) && ($sirens < 14)){
 quest::signal(68188);
 if($debugpl){quest::shout ("Zoneing in From the OOT, setting 1");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",1,7,"F");
 $sirens=undef;}
elsif (($sirens==1) && ($sirens < 14)){
 if($debugpl) {quest::shout ("setting 2");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",2,7,"F");
 $sirens=undef;}
elsif (($sirens==2) && ($sirens < 14)){
 if($debugpl) {quest::shout ("setting 3");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",3,7,"F");
 $sirens=undef;}
elsif (($sirens==3) && ($sirens < 14)){
 if($debugpl) {quest::shout ("setting 4");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",4,7,"F");
 $sirens=undef;}
elsif (($sirens==4) && ($sirens < 14)){
 if($debugpl) {quest::shout ("setting 5");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",5,7,"F");
 $sirens=undef;}
elsif (($sirens==5) && ($sirens < 14)){
 if($debugpl) {quest::shout ("setting 6");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",6,7,"F");
 $sirens=undef;}
elsif (($sirens==6) && ($sirens < 14)){
 if($debugpl) {quest::shout ("AT PIER setting 7");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",7,7,"F");
 $sirens=undef;}
elsif (($sirens==7) && ($sirens < 14)){
 if($debugpl) {quest::shout ("Leaving PIER setting 8");}
 if($debugpl) {quest::shout ("setting 8");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",8,7,"F");
 $sirens=undef;}
elsif (($sirens==8) && ($sirens < 14)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",9,7,"F");
 $sirens=undef;}
elsif (($sirens==9) && ($sirens < 14)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",10,7,"F");
 $sirens=undef;}
elsif (($sirens==10) && ($sirens < 14)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",11,7,"F");
 $sirens=undef;}
elsif (($sirens==11) && ($sirens < 14)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",12,7,"F");
 $sirens=undef;}
elsif (($sirens==12) && ($sirens < 14)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",13,7,"F");
 $sirens=undef;}
elsif (($sirens==13) && ($sirens < 14)){
 if($debugpl) {quest::shout ("ZONEING OOT setting 14");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",14,7,"F");
 $sirens=undef;}
}

