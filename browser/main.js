var Tone = require('tone');

const lowPass = new Tone.Filter({
	frequency: 14000,
}).toDestination();


// we can make our own hi hats with 
// the noise synth and a sharp filter envelope
const openHiHat = new Tone.NoiseSynth({
	volume: -10,
	envelope: {
		attack: 0.01,
		decay: 0.3
	},
}).connect(lowPass);

const openHiHatPart = new Tone.Part(((time) => {
	openHiHat.triggerAttack(time);
}), [{ "8n": 2 }, { "8n": 6 }]).start(0);

const closedHiHat = new Tone.NoiseSynth({
	volume: -10,
	envelope: {
		attack: 0.01,
		decay: 0.15
	},
}).connect(lowPass);

const closedHatPart = new Tone.Part(((time) => {
	closedHiHat.triggerAttack(time);
}), [0, { "16n": 1 }, { "8n": 1 }, { "8n": 3 }, { "8n": 4 }, { "8n": 5 }, { "8n": 7 }, { "8n": 8 }]).start(0);


console.log('hello world, glad to see you!!')
//create a synth and connect it to the main output (your speakers)
Tone.Transport.loop = true;
//Tone.Transport.loopStart = 0;
//Tone.Transport.loopEnd = "1:0";
Tone.Transport.start();
// ramp up to 800 bpm over 10 seconds

document.querySelector('button')?.addEventListener('click', async () => {
	await Tone.start()
	console.log('audio is ready')
})