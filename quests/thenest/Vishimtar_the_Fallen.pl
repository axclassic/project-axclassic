sub EVENT_SPAWN {

 quest::setnexthpevent(75);

 }

sub EVENT_HP {
 if (hpevent == 75){
 quest::spawn2(343160,0,0,-4577.4,456.1,130.4,32.8);
 quest::spawn2(343163,0,0,-4435.8,755.6,128.5,128.2);
 quest::spawn2(343164,0,0,-4335.1,666.9,129,177.2);
 quest::spawn2(343165,0,0,-4295.7,378.6,128.4,241.8);
 }
 elsif (hpevent == 60){
quest::spawn2(343095,0,0,-4352.6,357.4,128,19.6);
 }
 elsif (hpevent == 50){
 quest::spawn2(343093,0,0,-4580.1,568.5,127.1,53.1);
 quest::spawn2(343093,0,0,-4588.2,496.4,128.9,47);
 quest::spawn2(343093,0,0,-4490.7,692.2,128,106.5);
 quest::spawn2(343093,0,0,-4452.4,710.1,127.8,127.4);
 }
 elsif (hpevent == 40){
quest::spawn2(343095,0,0,-4432.3,652.9,128.5,125.2);
 }
 elsif (hpevent == 20){
quest::spawn2(343095,0,0,-447.6,531.1,129.1,249.5);
 }
}
sub EVENT_DEATH {
quest::signalwith(343160,400,0); 
quest::signalwith(343163,400,0);
quest::signalwith(343164,400,0);
quest::signalwith(343165,400,0);
quest::signalwith(343162,400,0);
quest::signalwith(343093,400,0);
quest::signalwith(343161,400,0);
quest::signalwith(343095,400,0);
}