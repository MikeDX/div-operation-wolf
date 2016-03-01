program opwolf;

local

count=0;


begin

set_mode(320240);
set_fps(24,0);

write_int(0,0,0,0,&fps);

load_fpg("opwolf/opwolf.fpg");
frame(4000);

fade(0,0,0,64);

laces();

taitologo();

clear_screen();

fade(100,100,100,64);


map();

loop

frame;

end


end


function laces();

begin

//fade(0,0,0,1);

define_region(1,0,120,152,120);

fade(0,0,0,64);

while(fading)
frame;
end

graph=5;

region=1;
x=76;
y=180;
hand(1);
hand(-1);

fade(100,100,100,10);

while(fading)
frame;
end


loop
//x=mouse.x;
//y=mouse.y;

frame;
end

end

process hand(xoff)

begin

region=1;
graph=6+(xoff==-1);

x=32+82*(xoff==-1);
y=175;
frame(4000);
//debug;
//set_fps(60,0);

from count = 1 to 31;
x-=xoff;
frame(50);
end

frame(4000);

//set_fps(24,0);

fade_off();
while(fading)
frame;
end

if(xoff==-1)
    signal(father,s_kill);
end

end

function taitologo()

begin


graph=1;
x=160;
y=90;

xput(file,graph,x,y,0,100,0,0);

fade_on();
while(fading)
frame;
end


//set_fps(60,0);

graph=2;

x=160;

from y = 300 to 160;
frame;

end

frame(6000);
fade(0,0,0,4);
while(fading)
frame;
end


end

process map()

begin

define_region(2,0,8,241,224);

start_scroll(1,file,8,0,2,1);

loop

scroll[1].x0--;

frame;

end

end
