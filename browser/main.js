var Tone = require('tone');



console.log('hello world, glad to see you')
//create a synth and connect it to the main output (your speakers)
const synthA = new Tone.AMSynth().toDestination();
const synthB = new Tone.FMSynth().toDestination();
//play a note every quarter-note
const loopA = new Tone.Loop(time => {
	synthA.triggerAttackRelease("C2", "8n", time);
}, "4n").start(0);
//play another note every off quarter-note, by starting it "8n"
const loopB = new Tone.Loop(time => {
	synthB.triggerAttackRelease("C4", "8n", time);
}, "4n").start("8n");
// the loops start when the Transport is started
Tone.Transport.start()
// ramp up to 800 bpm over 10 seconds
Tone.Transport.bpm.rampTo(800, 3);

document.querySelector('button')?.addEventListener('click', async () => {
	await Tone.start()
	console.log('audio is ready')
})