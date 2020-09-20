use_synth :dark_ambience
use_random_seed 30

live_loop :bax do
  with_fx :lpf, amp: 4 do
    play [:C4, chord(:c, :maj)].choose , attack: 0.5   , release: 5 , amp: 1.2
    sleep 3
    play [chord(:f, :maj),:A4].choose
    sleep 3
  end
end# Welcome to Sonic Pi

drums = [:drum_bass_hard, :drum_snare_soft, :drum_cymbal_open,:drum_bass_soft, :drum_cymbal_closed].ring
live_loop :drums do
  sample drums.tick, amp: rrand(0.6,0.7)
  if drums.tick == :drum_bass_hard
    sleep 0.25
  else
    sleep 0.5
  end
end


sleep 4
chords = [chord(:C3, :major),chord(:G3, :major), chord(:A3, :minor), chord(:F3, :major)].ring
loop do
  use_synth :beep
  measure = chords.tick
  play measure[0], release: 0.5, cutoff: 20
  sleep 1
  play measure[2], release: 0.5, cutoff: 20, amp:0.2
  play measure[1], release: 0.5, cutoff: 20, amp:0.1
  sleep 0.5
  play measure
  sleep 1
  
end

