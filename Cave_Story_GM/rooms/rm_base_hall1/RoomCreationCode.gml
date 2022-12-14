setStageName(-1, "Base Hall A");

addEvent(90,
	"<MNA",
	cmdLine("<CMU", Music.geothermal),
	cmdLine("<FAI", Dir.left),
	);


addEvent(200,
	"<PRI<KEY",
	cmdLine("<ANP", 200, 0, Dir.right),
	cmdLine("<FAO", Dir.left),
	cmdLine("<TRR", rm_base_start, 90, 41, 16)
	);
	
addEvent(201,
	"<PRI<KEY<MSGIt's locked...<NOD"
	);